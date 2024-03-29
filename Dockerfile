# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

WORKDIR /app

# ENV FLASK_APP=app.webapp

RUN apt-get update -y
RUN apt-get install libpq-dev gcc -y

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app.webapp:app"]
