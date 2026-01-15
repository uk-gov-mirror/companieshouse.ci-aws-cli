FROM alpine:3.23

RUN apk add --no-cache \
        aws-cli=2.32.7-r0 \
        bash=5.3.3-r1 \
        curl=8.17.0-r1 \
        jq=1.8.1-r0 \
        python3=3.12.12-r0
