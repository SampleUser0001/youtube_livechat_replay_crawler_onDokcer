# 任意のイメージを取得
FROM python:3.10-rc-buster

RUN apt update && apt upgrade -y
RUN apt install -y less git 

WORKDIR /opt
RUN git clone https://github.com/hase-ryo/youtube_livechat_replay_crawler.git

RUN ls
# WORKDIR /opt/youtube_livechat_replay_crawler
# RUN pip install python-dotenv google-cloud-language

WORKDIR /opt/youtube_livechat_replay_crawler/bigquery_ops/
# RUN git submodule add https://github.com/hase-ryo/gcs_wrapper.git

WORKDIR /opt/youtube_livechat_replay_crawler/channel_video_list/
RUN pip install -r requirements.txt
# RUN git submodule add https://github.com/hase-ryo/gcs_wrapper.git
COPY ./opt/youtube_livechat_replay_crawler/bigquery_ops/.env /opt/youtube_livechat_replay_crawler/channel_video_list/.env

WORKDIR /opt/youtube_livechat_replay_crawler/continuation_livechat_crawler/
RUN pip install -r requirements.txt
# RUN git submodule add https://github.com/hase-ryo/gcs_wrapper.git
COPY ./opt/youtube_livechat_replay_crawler/continuation_livechat_crawler/.env /opt/youtube_livechat_replay_crawler/continuation_livechat_crawler/.env

WORKDIR /opt/youtube_livechat_replay_crawler/initial_livechat_check/
RUN pip install -r requirements.txt
# RUN git submodule add https://github.com/hase-ryo/gcs_wrapper.git
COPY ./opt/youtube_livechat_replay_crawler/initial_livechat_check/.env /opt/youtube_livechat_replay_crawler/initial_livechat_check/.env

WORKDIR /opt/youtube_livechat_replay_crawler/untouched_video_checker/
RUN pip install -r requirements.txt
# RUN git submodule add https://github.com/hase-ryo/gcs_wrapper.git
COPY ./opt/youtube_livechat_replay_crawler/untouched_video_checker/.env /opt/youtube_livechat_replay_crawler/untouched_video_checker/.env

WORKDIR /opt/youtube_livechat_replay_crawler

# CMD ["python"]