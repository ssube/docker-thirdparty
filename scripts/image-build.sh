#! /bin/bash

cd ${IMAGE_ROOT}
export IMAGE_TAG="${IMAGE_NAME}:${IMAGE_VERSION}-${CI_COMMIT_REF_SLUG}"
docker build -t ${IMAGE_TAG} .
IMAGE_HASH=$(docker images | grep ${IMAGE_NAME} | head -n 1 | awk '{ print $3; }')
echo "Testing image: ${IMAGE_HASH}"

docker run --rm -v $(pwd):/tests:ro --entrypoint /usr/local/bin/goss
${IMAGE_HASH} --gossfile /tests/Gossfile.yml validate
docker push ${IMAGE_TAG}

if [[ "${CI_COMMIT_REF_SLUG}" == "master" ]];
then
  docker tag ${IMAGE_TAG} ${IMAGE_NAME}:${IMAGE_VERSION};
  docker push ${IMAGE_NAME}:${IMAGE_VERSION};
fi