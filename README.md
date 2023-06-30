# docker-buf-go
This is the source for a docker image that has buf, protoc-gen-go and protoc-gen-go-grpc packaged in. By default, the (bufbuild/buf)[https://hub.docker.com/r/bufbuild/buf] image does not include what is needed to make go protobuf code and related gRPC code. This image fixes that by including them in.

See documentation at https://hub.docker.com/r/bufbuild/buf for more detail.

Example usage:
```
docker container run --rm -w /defs -v $(pwd):/defs sudorandom/buf-go generate
```
