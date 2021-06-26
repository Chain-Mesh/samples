IMAGETAG="latest"
COMPOSE_FILE_BESU=docker/docker-compose.yaml

IMAGE_TAG=$IMAGETAG docker-compose -f ${COMPOSE_FILE_BESU} up -d