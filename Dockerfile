# 任意のイメージを取得
FROM python:3.10-rc-buster

RUN apt update && apt upgrade -y
RUN apt install -y less git 

WORKDIR /opt

RUN git clone https://github.com/hase-ryo/youtube_livechat_replay_crawler.git

WORKDIR /opt/youtube_livechat_replay_crawler

RUN pip install python-dotenv google-cloud-language

WORKDIR /opt/youtube_livechat_replay_crawler/bigquery_ops
RUN git submodule add https://github.com/hase-ryo/gcs_wrapper.git gcs_wrapper
    
WORKDIR /opt/youtube_livechat_replay_crawler

# CMD ["python"]