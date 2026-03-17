IMAGE_NAME="ggnagpae1/calculator"
TAG="latest"

# 기존 이미지가 있는지 확인
if docker images | grep -q "$IMAGE_NAME"; then
    echo "이미지 $IMAGE_NAME:$TAG 삭제 중..."
    docker rmi -f "$IMAGE_NAME:$TAG"
fi

docker ps -q -f name=calculator | grep -q . && sudo docker stop calculator

# 새 이미지 다운로드
echo "이미지 $IMAGE_NAME:$TAG 다운로드 중..."
docker pull "$IMAGE_NAME:$TAG"

docker run -d -p 9090:9090 --rm --name calculator "$IMAGE_NAME:$TAG"
docker image prune -f
echo "작업 완료!"