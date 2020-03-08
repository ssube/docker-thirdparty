FROM apextoaster/base:1.2-master

ENV GO_VERSION 1.14
ENV GOPATH /usr/local/go

# install golang
RUN mkdir -pv ${GOPATH}/bin ${GOPATH}/src \
 && curl https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz -o golang.tar.gz \
 && tar -C /usr/local -xzf golang.tar.gz

ENV PATH "/usr/local/go/bin:${PATH}"
