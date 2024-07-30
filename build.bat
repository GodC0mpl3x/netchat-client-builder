@echo off
if exist netchat-client\src (
    docker buildx build --target=artifact --output type=local,dest=%cd%\out\ . --build-arg LOCAL="local"
) else (
    docker buildx build --target=artifact --output type=local,dest=%cd%\out\ . --build-arg LOCAL="remote"
)
