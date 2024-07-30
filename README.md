# netchat-client builder

A docker implementation to build [netchat-client](https://github.com/tkbstudios/netchat-client) 

Just run build.sh

If you have the "netchat-client" folder in the same directory as build.sh and the Dockerfile then it'll use that source to build the files otherwise it'll pull from github the most recent version and build using that. 

The final build files and the source used to build it placed in "out" with the build files under "out/netchat-client/bin/"

