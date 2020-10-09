APP="mediafinder"

docker image build -t $APP . 
docker image tag $APP julioct99/$APP