FROM amazonlinux:2018.03

ARG TERRAFORM_VER=0.14.10
ENV TERRAFORM_VER=${TERRAFORM_VER}
ARG AWS_CLI_VER=2.1.36
ENV AWS_CLI_VER=${AWS_CLI_VER}

RUN yum install -y jq unzip shadow-utils
RUN useradd -ms /bin/bash tf_pipeline

# Terraform install
RUN curl -L -O https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip
RUN unzip terraform_${TERRAFORM_VER}_linux_amd64.zip -d /usr/sbin && rm *.zip

# AWS CLI install
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VER}.zip" -o "awscliv2.zip"
RUN unzip -q awscliv2.zip && rm *.zip
RUN ./aws/install

COPY github-callback.sh /opt/
RUN chmod +x /opt/github-callback.sh

USER tf_pipeline
