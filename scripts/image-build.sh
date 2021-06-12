#! /bin/bash

set -euxo pipefail

cd ${IMAGE_ROOT}
export IMAGE_TAG="${IMAGE_NAME}:${IMAGE_VERSION}-${CI_COMMIT_REF_SLUG}"

# pull the previous image from the same branch or master to leverage its layers
docker pull docker.artifacts.apextoaster.com/${IMAGE_TAG} || \
  docker pull docker.artifacts.apextoaster.com/"${IMAGE_NAME}:${IMAGE_VERSION}-master" || \
  true  # no existing image is not an error

# build and test a new image
docker build -t ${IMAGE_TAG} .
docker run --rm -v $(pwd):/tests:ro --entrypoint /usr/local/bin/goss ${IMAGE_TAG} --gossfile /tests/Gossfile.yml validate

# prepare to push
function push_image() {
  local PUSH_TAG="${1:-${IMAGE_TAG}}"

  docker push ${PUSH_TAG} || true
  docker tag ${PUSH_TAG} docker-push.artifacts.apextoaster.com/${PUSH_TAG}
  docker push docker-push.artifacts.apextoaster.com/${PUSH_TAG}

  if [[ "${CI_COMMIT_REF_SLUG}" == "master" ]];
  then
    docker tag ${PUSH_TAG} ${IMAGE_NAME}:${IMAGE_VERSION}
    docker push ${IMAGE_NAME}:${IMAGE_VERSION}

    docker tag ${IMAGE_NAME}:${IMAGE_VERSION} docker-push.artifacts.apextoaster.com/${IMAGE_NAME}:${IMAGE_VERSION}
    docker push docker-push.artifacts.apextoaster.com/${IMAGE_NAME}:${IMAGE_VERSION}
  fi
}

# push under the normal tag
push_image "${IMAGE_TAG}"

# push under each alt tag
for alt_name in "${IMAGE_ALT:-}";
do
  [[ -z "${alt_name}" ]] && continue

  ALT_TAG="${alt_name}:${IMAGE_VERSION}-${CI_COMMIT_REF_SLUG}"
  docker tag ${IMAGE_TAG} ${ALT_TAG}
  push_image "${ALT_TAG}"
done
