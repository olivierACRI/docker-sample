FROM python:3.7.11-slim-buster

LABEL NM <nmaltsev@argans.eu>
EXPOSE 8000
ARG WORK_DIR="/opt"


WORKDIR $WORK_DIR
RUN pip install --upgrade pip && pip install aiohttp==3.7.4
COPY src/. ./
RUN chmod +x ./main.sh

CMD ["./main.sh"]
