FROM python:3.8-alpine

WORKDIR /app

ADD requirements.txt .
RUN apk add --no-cache build-base mariadb-connector-c-dev
RUN pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

ADD api ./api
CMD ["uvicorn", "api.main:app", "--reload", "--host", "127.0.0.1", "--port", "8000"]
