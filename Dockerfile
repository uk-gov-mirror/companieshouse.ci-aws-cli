FROM alpine:3.21

RUN apk add --no-cache \
        aws-cli=2.22.10-r0 \
        bash=5.2.37-r0 \
        curl=8.14.1-r2 \
        jq=1.7.1-r0 \
        python3=3.12.12-r0
