FROM mongo:latest AS base

ARG DUMPFILE=https://storage.googleapis.com/sefaria-mongo-backup/dump.tar.gz

RUN apt update && apt upgrade -yq && apt install -y mongodb-database-tools wget

RUN wget -c ${DUMPFILE} -O /tmp/dump.tar.gz

COPY ./restoredb.sh ./restoredb.sh
