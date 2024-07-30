ARG LOCAL

#RemoteBuild
FROM python:3 AS build_remote
ENV PATH="/CEdev/bin:$PATH"
RUN wget https://github.com/CE-Programming/toolchain/releases/latest/download/CEdev-Linux.tar.gz && tar -xvf CEdev-Linux.tar.gz && rm CEdev-Linux.tar.gz 
ONBUILD RUN git clone https://github.com/tkbstudios/netchat-client && cd netchat-client/ && rm -rf app_tools && git submodule init && git submodule update --recursive && make

#LocalBuild
FROM python:3 AS build_local
ENV PATH="/CEdev/bin:$PATH"
ONBUILD RUN wget https://github.com/CE-Programming/toolchain/releases/latest/download/CEdev-Linux.tar.gz && tar -xvf CEdev-Linux.tar.gz && rm CEdev-Linux.tar.gz 
ONBUILD COPY /netchat-client/ /netchat-client/
ONBUILD RUN cd netchat-client && make

FROM build_${LOCAL} AS final
RUN touch test.txt
RUN ls -an && echo "hello"
#COPY netchat-client/ /netchat-client/


#output to file
FROM scratch AS artifact
COPY --from=final /netchat-client/ /netchat-client/

#ADD test /
#CMD ["/test"]

#COPY --from=build /var/task/lambdatest.zip /lambdatest.zip
