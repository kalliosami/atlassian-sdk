FROM adoptopenjdk:8-hotspot-bionic
LABEL maintainer="Aitio Finland Oy"
LABEL description="Dockerized Atlassian SDK on AdoptOpenJDK 8"

ENV ATLASSIAN_SDK_VERSION="8.0.16"

RUN apt-get update &&\
    apt-get install -y --no-install-recommends curl gnupg &&\
    sh -c 'echo "deb https://packages.atlassian.com/debian/atlassian-sdk-deb/ stable contrib" >>/etc/apt/sources.list' &&\
    curl -LO https://packages.atlassian.com/api/gpg/key/public &&\
    apt-key add public &&\
    apt-get update &&\
    apt-get install -y --no-install-recommends atlassian-plugin-sdk=${ATLASSIAN_SDK_VERSION} &&\
    apt-get remove -y curl gnupg &&\
    apt-get autoremove -y &&\
    apt-get clean all

WORKDIR /opt
RUN atlas-version

EXPOSE 1990 2990 3990 4990 5990 6990 7990
