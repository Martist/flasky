FROM python:3.6-alpine

ENV FLASK_APP flasky.py
ENV FLASK_CONFIG testing

RUN mkdir /home/flasky
WORKDIR /home/flasky

COPY requirements requirements
RUN python -m venv venv
RUN venv/bin/pip install -r requirements/docker.txt

COPY app app
COPY migrations migrations
COPY tests test
COPY flasky.py config.py boot.sh ./

# run-time configuration
EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
