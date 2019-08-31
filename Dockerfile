FROM golang:1.12 as builder
WORKDIR /go/github.com/hyperonecom/terraform-provider-hyperone
COPY ./ .
RUN make build
FROM hashicorp/terraform:light
COPY --from=builder /go/bin/terraform-provider-hyperone /usr/local/bin
