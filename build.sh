if [ -d netchat-client/src ]; then
	docker buildx build --target=artifact --output type=local,dest=$(pwd)/out/ . --no-cache --build-arg LOCAL="local"
else 
	docker buildx build --target=artifact --output type=local,dest=$(pwd)/out/ . --no-cache --build-arg LOCAL="remote"
fi
