APP="mediafinder"
PROFILE="julioct99"

docker image build -t $APP . 

docker image tag $APP $PROFILE/$APP
docker image tag $APP $PROFILE/$APP:build

docker image push $PROFILE/$APP:build