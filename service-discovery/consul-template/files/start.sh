#!/bin/bash
service nginx start
consul-template -config=/templates/nginx.json -consul=${CONSUL_URL}