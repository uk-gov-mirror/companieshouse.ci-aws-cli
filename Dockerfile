FROM centos:centos8.4.2105

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    dnf update -y && \
    dnf install -y \
        epel-release-8 \
        jq-1.5 \
        unzip-6.0 \
        yum-utils-4.0.21 && \
    dnf clean all

RUN curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf ./aws && \
    rm -f awscliv2.zip

RUN rpm --import http://yum-repository.platform.aws.chdev.org/RPM-GPG-KEY-platform-noarch && \
    yum-config-manager --add-repo http://yum-repository.platform.aws.chdev.org/platform-noarch.repo && \
    dnf install -y \
        platform-tools-common-1.0.6 && \
    dnf clean all
