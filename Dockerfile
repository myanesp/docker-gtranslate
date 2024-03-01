FROM alpine:latest

RUN apk update && apk add --no-cache curl git make go gcc g++ musl-dev

RUN git clone https://git.sr.ht/~yerinalexey/gtranslate && \
    cd gtranslate && \
    make

WORKDIR /gtranslate

EXPOSE 5000

ENTRYPOINT ["./gtranslate-server"]