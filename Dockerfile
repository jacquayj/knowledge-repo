FROM python:3
COPY . /app
WORKDIR /app
RUN pip install knowledge-repo[all]
RUN pip install --upgrade requests psycopg2 requests_oauthlib flask_login flask_principal

CMD bash ls -la

CMD bash start.sh