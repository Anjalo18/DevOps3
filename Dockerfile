FROM ubuntu

WORKDIR /home/ubuntu

# Update the apt package list
RUN apt-get update 

# Install the OpenSSH server and SSH client
RUN apt-get install -y openssh-server ssh

# Create the directory for SSH daemon to run
RUN mkdir /var/run/sshd

# Expose port 22 for SSH connections
EXPOSE 22

# Set the password for the 'ubuntu' user
RUN echo 'ubuntu:password' | chpasswd

# Copy the local script 'inventoty.sh' into the container's current directory
COPY inventoty.sh .

# Make the 'inventoty.sh' script executable
RUN chmod +x inventoty.sh

# Set the default command to run the 'inventoty.sh' script and start the SSH daemon
CMD ["sh", "-d", "inventoty.sh && /usr/sbin/sshd"]
