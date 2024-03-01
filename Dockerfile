FROM alpine:latest

LABEL org.opencontainers.image.title="gtranslate Docker image"
LABEL org.opencontainers.image.description="Docker image for gtranslate, a lightweight frontend by yerinalexey for Google Translate, without tracking"
LABEL org.opencontainers.image.authors="Mario Yanes <mario.yanes@uc3m.es> (@myanesp)"
LABEL org.opencontainers.image.url=https://github.com/myanesp/docker-gtranslate/blob/main/README.md
LABEL org.opencontainers.image.documentation=https://github.com/myanesp/docker-gtranslate
LABEL org.opencontainers.image.source=https://github.com/myanesp/docker-gtranslate
LABEL org.opencontainers.image.licenses="AGPL-3.0-or-later"

RUN apk update && apk add --no-cache curl git make go gcc g++ musl-dev

RUN git clone https://git.sr.ht/~yerinalexey/gtranslate && \
    cd gtranslate && \
    make

WORKDIR /gtranslate

EXPOSE 5000

ENTRYPOINT ["./gtranslate-server"]