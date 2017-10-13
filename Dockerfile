FROM ubuntu:16.04
MAINTAINER Suway Chang<solzxeramdj@gmail.com>
#g/ u系統升級 & 安裝必要工具
RUN apt-get update -y
RUN apt-get install -y curl software-properties-common git

WORKDIR /root
# 安裝 Web2pdf 必要元件
RUN apt-get install -y fontconfig fontconfig-config fonts-dejavu-core \
	libfontconfig1 libfontenc1 libfreetype6 libjpeg-turbo8 libx11-6 libx11-data \
	libxau6 libxcb1 libxdmcp6 libxext6 libxfont1 libxrender1 \
	x11-common xfonts-base xfonts-encodings xfonts-utils xfonts-75dpi
# 安裝 CJK 字型
RUN apt-get install -y ttf-wqy-microhei fonts-indic
# 安裝 Python 根元件
RUN apt-get -y install python-pip
RUN apt-get -y install gunicorn

# 執行 git 指令 clone 專案 並且複製 (感謝warenix提供)
RUN git clone https://github.com/warenix/Web2PDF.git
RUN mkdir -p /app
RUN cp -R Web2PDF/docker/Web2PDF-api/* /app

WORKDIR /app
#賦予權限
RUN chown -R root:root /app
RUN chmod -R u+w,g+w /app
RUN python setup.py develop
USER root

EXPOSE 8080

ENTRYPOINT ["gunicorn", "-b :8080", "-w 4", "app:app"]
