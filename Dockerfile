FROM kong:2.8.3-alpine

LABEL description="Alpine + Kong  + kong-oidc plugin"

USER root
RUN apk update && apk add curl git gcc musl-dev
RUN luarocks install luaossl OPENSSL_DIR=/usr/local/kong CRYPTO_DIR=/usr/local/kong
RUN luarocks install --pin lua-resty-jwt


# May not need these operations at all
RUN luarocks install  lua-resty-openidc 1.7.2 
RUN luarocks remove --force lua-resty-http
RUN luarocks install lua-resty-http 0.14


RUN luarocks install kong-oidc

USER root
