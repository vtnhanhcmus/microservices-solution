FROM nginx:latest

MAINTAINER nhat.nguyen <nminhnhat2008@gmail.com>

ENV CONSUL_URL {{ consul.container_name }}:8500
ENV CONSUL_TEMPLATE_VERSION 0.14.0

RUN rm -f /etc/localtime
RUN ln -s /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime

RUN apt-get update && \
    apt-get install -y unzip

ADD start.sh /bin/start.sh
RUN chmod +x /bin/start.sh

RUN rm -rf /etc/nginx/conf.d/*.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY proxy.inc /etc/nginx/proxy.inc

ADD https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip /

RUN unzip consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    mv consul-template /usr/local/bin/consul-template &&\
    rm -rf /consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip

VOLUME  ["/templates"]

EXPOSE 80

ENTRYPOINT ["/bin/start.sh"]

RUN echo "Success"
