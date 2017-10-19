FROM alpine:edge

MAINTAINER sxf <ispwdz@qq.com>

RUN apk update && \
	apk add --no-cache --update bash && \
	mkdir -p /aria2/conf && \
	mkdir -p /aria2/conf-copy && \
	mkdir -p /aria2/data && \
	apk add --no-cache --update aria2 && \
	apk add git && \
	git clone https://github.com/ziahamza/webui-aria2 /aria2/aria2-webui && \
    rm /aria2/aria2-webui/.git* -rf && \
    apk del git && \
	apk add --update darkhttpd

ADD files/start.sh /aria2/conf-copy/start.sh
ADD files/aria2.conf /aria2/conf-copy/aria2.conf
ADD files/on-complete.sh /aria2/conf-copy/on-complete.sh

RUN chmod +x /aria2/conf-copy/start.sh

WORKDIR /

ENV SECRET SECRET

VOLUME ["/aria2/data"]
VOLUME ["/aria2/conf"]

EXPOSE 6800
EXPOSE 80
EXPOSE 8080

CMD ["/aria2/conf-copy/start.sh"]
