FROM apextoaster/base:master

ENV GO_VERSION 1.10.1
ENV GOPATH /go

RUN mkdir -pv ${GOPATH}/bin ${GOPATH}/src \
 && curl https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz -o golang.tar.gz \
 && tar -C /usr/local -xzf golang.tar.gz \
 && curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

ENV PATH "/go/bin:${PATH}"