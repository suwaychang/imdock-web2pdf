FROM ubuntu:16.04

RUN apt-get update; apt-get install -y curl software-properties-common

WORKDIR /root

RUN apt-get install -y fontconfig fontconfig-config fonts-dejavu-core \
libfontconfig1 libfontenc1 libfreetype6 libjpeg-turbo8 libx11-6 libx11-data \
libxau6 libxcb1 libxdmcp6 libxext6 libxfont1 libxrender1\
 x11-common xfonts-base xfonts-encodings xfonts-utils xfonts-75dpi

RUN apt-get install -y ttf-wqy-microhei fonts-indic

RUN apt-get -y install python-pip

RUN apt-get -y install gunicorn

RUN useradd -ms /bin/bash -G root web2pdf

RUN mkdir -p /app

COPY Web2PDF-api/. /app

WORKDIR /app

RUN chown -R web2pdf:root /app
RUN chmod -R u+w,g+w /app
RUN python setup.py develop

EXPOSE 8080

USER web2pdf
ENTRYPOINT ["gunicorn", "-b :8080", "-w 4", "app:app"]
