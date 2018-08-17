FROM golang:1.10.3-alpine

# ENV http_proxy=$http_proxy
# ENV http_proxy=http://$HTTP_PROXY
RUN apk --no-cache add make git curl bash fish

# build tools
COPY ./Makefile /go/src/gitlab.protectv.local/regan/flume.git/
WORKDIR /go/src/gitlab.protectv.local/regan/flume.git
RUN make tools

COPY ./ /go/src/gitlab.protectv.local/regan/flume.git

CMD make all

# unset proxy vars, just used in build
# ENV http_proxy=