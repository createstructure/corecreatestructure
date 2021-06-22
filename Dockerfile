# Get the ubuntu image from Docker Hub
FROM ubuntu:latest

# Install requirements
RUN apt install g++ libssl-dev libcurl4-openssl-dev

# Copy the current folder which contains C++ source code to the Docker image under /usr/src
COPY ./bin /usr/src/createstructure

# Specify the working directory
WORKDIR /usr/src/createstructure

# Use GCC to compile the source file
RUN g++ core.cpp -o core -lcurl -lcrypto

# Setup git
RUN apt install git -y
RUN git config --global user.email "contacts@castellanidavide.it"
RUN git config --global user.name "createstructure"
RUN git config --global init.defaultBranch "main"

# Run the program output from the previous step
ENTRYPOINT ["./core"]
