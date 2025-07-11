############################
# STEP 1 build executable binary
############################
FROM golang:alpine AS builder

RUN --mount=type=tmpfs,target=/build
WORKDIR /build

# Install git + SSL ca certificates.
# Git is required for fetching the dependencies.
# Ca-certificates is required to call HTTPS endpoints.
RUN apk update && apk add --no-cache git ca-certificates tzdata alpine-sdk && update-ca-certificates

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .
RUN make build

#############################
## STEP 2 build a small image
#############################
FROM alpine:latest

# Import from builder.
COPY --from=builder /usr/share/zoneinfo /usr/share/zoneinfo
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /etc/passwd /etc/passwd

# Copy our static executable
COPY --from=builder /build/mbmd /usr/local/bin/mbmd

# Run as nonroot
RUN adduser -S mbmd -G dialout
USER mbmd

EXPOSE 8080

# Run the binary
ENTRYPOINT ["/usr/local/bin/mbmd"]
