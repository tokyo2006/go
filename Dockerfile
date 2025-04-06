FROM kellegous/build:f1799259 AS build

COPY . /src
RUN cd /src && CGO_ENABLED=0 make clean all

FROM scratch

COPY --from=build /src/bin/go /

EXPOSE 8067

ENTRYPOINT [ "/go" ]
CMD ["--data=/data"]
