FROM golang:latest as golang
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

FROM bufbuild/buf:latest as buf

FROM scratch
COPY --from=golang /go/bin/protoc-gen-go /go/bin/protoc-gen-go
COPY --from=golang /go/bin/protoc-gen-go-grpc /go/bin/protoc-gen-go-grpc
COPY --from=buf /usr/local/bin/buf /usr/local/bin/buf
ENV PATH="/go/bin:${PATH}"
ENTRYPOINT ["/usr/local/bin/buf"]
