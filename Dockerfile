FROM python:3.10

WORKDIR /web

RUN pip install pipenv

COPY Pipfile.lock Pipfile.lock

RUN pipenv sync

EXPOSE 8000

COPY web /web

#COPY web/run.sh web/run.sh

#CMD chmod 755 web/run.sh
CMD ./run.sh





#FROM python:3.8
#
#WORKDIR /web
#
#RUN pip install pipenv
#
#COPY Pipfile.lock Pipfile.lock
#
#RUN pipenv sync
#
#EXPOSE 8000
#
#COPY web /web
#
#CMD ./run.sh