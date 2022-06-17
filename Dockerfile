FROM python:3.9.10-slim-buster
LABEL maintainer="nmaltsev@argans.eu"
EXPOSE 10000
EXPOSE 8000
ARG WORK_DIR="/opt"
WORKDIR $WORK_DIR
RUN pip install --no-cache-dir aiohttp=
COPY src/. ./
RUN chmod +x ./main.sh
CMD ["./main.sh"]
