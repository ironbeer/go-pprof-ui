FROM golang:1.18

RUN ln -s /usr/local/go/bin/go /usr/local/bin/go
RUN apt update && apt install -y graphviz

# GitHub Actionsでのビルド時のソースコードclone場所
WORKDIR /home/runner/work/verse-verifier

ARG GIT_REPO=https://github.com/oasysgames/verse-verifier.git
RUN git clone $GIT_REPO

WORKDIR /home/runner/work/verse-verifier/verse-verifier

ARG GIT_TAG=main
RUN git checkout $GIT_TAG

RUN go mod download
