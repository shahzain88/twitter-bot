FROM continuumio/miniconda3

RUN apt-get update -y
RUN apt-get install build-essential -y

RUN conda create -n py36 python=3.6
RUN conda run -n py36 pip install schedule redis tweepy textblob pandas numpy matplotlib seaborn

ENV TZ=US/Central
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY bot.py /tmp/bot.py

CMD ["/bin/bash", "-c", "source activate py36 && python -u /tmp/bot.py" ]