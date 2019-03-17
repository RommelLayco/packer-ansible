FROM centos:7

ENV PACKER_VERSION=1.3.5
ENV ANSIBLE_VERSION=2.7.6

# Install git
RUN yum install -y git

# Install ansible
RUN yum install epel-release unzip -y && yum install python-pip -y
RUN pip install ansible==${ANSIBLE_VERSION}

# Install packer
RUN curl -O https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip
RUN unzip -d /usr/local packer_${PACKER_VERSION}_linux_amd64.zip
RUN ln -s /usr/local/packer /usr/local/bin/packer.io

CMD ["/bin/bash"]
