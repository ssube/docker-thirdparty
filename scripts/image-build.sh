#! /bin/bash

set -euxo pipefail

cd ${IMAGE_ROOT}
export IMAGE_TAG="${IMAGE_NAME}:${IMAGE_VERSION}-${CI_COMMIT_REF_SLUG}"
docker pull ${IMAGE_TAG} || true
docker build -t ${IMAGE_TAG} .

docker run --rm -v $(pwd):/tests:ro --entrypoint /usr/local/bin/goss ${IMAGE_TAG} --gossfile /tests/Gossfile.yml validate
docker push ${IMAGE_TAG}

if [[ "${CI_COMMIT_REF_SLUG}" == "master" ]];
then
  docker tag ${IMAGE_TAG} ${IMAGE_NAME}:${IMAGE_VERSION};
  docker push ${IMAGE_NAME}:${IMAGE_VERSION};
fi
