## BUILDING
##   (from project root directory)
##   $ docker build -t e-llp-jenkins-kubernetes .
##
## RUNNING
##   $ docker run e-llp-jenkins-kubernetes

FROM gcr.io/stacksmith-images/ubuntu-buildpack:14.04-r8

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="mnzfujv" \
    STACKSMITH_STACK_NAME="E-LLP/jenkins-kubernetes" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install go-1.6.3-0 --checksum 8fd706186502cebc35bce121d3a176936153782a9ff4a9e4e93eee76c2ed02cc

ENV GOPATH=/gopath
ENV PATH=$GOPATH/bin:/opt/bitnami/go/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Go base template
COPY . /app
WORKDIR /app
