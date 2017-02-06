FROM python:3.6-alpine

ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /app

EXPOSE 7001

# S3 bucket in Cloud Services prod IAM
COPY bin/dumb-init /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init
ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]

RUN apk add --no-cache gcc musl-dev postgresql-dev

COPY ./requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt --no-cache-dir --disable-pip-version-check

COPY . /app
