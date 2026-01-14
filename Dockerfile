FROM amazonlinux:2023.9.20251208.0

RUN dnf install -y \
        awscli-2-2.32.1 \
        dnf-utils-4.3.0 \
        gzip-1.12 \
        jq-1.7.1 \
        tar-1.34 \
        unzip-6.0 && \
    dnf clean all

RUN rpm --import http://yum-repository.platform.aws.chdev.org/RPM-GPG-KEY-platform-noarch && \
    yum-config-manager --add-repo http://yum-repository.platform.aws.chdev.org/platform-noarch.repo && \
    dnf install -y \
        platform-tools-common-1.0.6 && \
    dnf clean all
