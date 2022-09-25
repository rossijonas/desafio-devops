FROM python:3.6

COPY ./ /base-test-api/

WORKDIR /base-test-api

EXPOSE 8080

RUN pip install pipenv && pipenv install

ENTRYPOINT ["pipenv", "run", "python", "start.py", "runserver"]

