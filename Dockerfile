FROM python:3.10

WORKDIR /web

RUN pip install pipenv

COPY Pipfile.lock Pipfile.lock

RUN pipenv sync

EXPOSE 8000

COPY web /web

COPY run.sh web/run.sh

CMD ./web/run.sh