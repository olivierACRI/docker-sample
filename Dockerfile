ARG BASE_VERSION=v2
ARG REGISTRY=scidockreg.esac.esa.int:62530
FROM ${REGISTRY}/datalabs/datalabs_base:${BASE_VERSION}-20.04
ENV DEBIAN_FRONTEND noninteractive
LABEL maintainer="nmaltsev@argans.eu"
EXPOSE 10000
EXPOSE 8000
ARG WORK_DIR="/opt"
WORKDIR $WORK_DIR
RUN pip install --no-cache-dir aiohttp==3.7.4
COPY src/. ./
RUN chmod +x ./main.sh
CMD ["./main.sh"]
