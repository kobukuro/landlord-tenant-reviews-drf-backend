FROM python:3.10.0-alpine3.15
ENV PYTHONUNBUFFERED 1
COPY ./requirements.txt /requirements.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000
RUN python -m venv /venv && \
    /venv/bin/pip install --upgrade pip && \
    # The "postgresql-client" dependency is the dependency
    # needed after the installation of the PostgreSQL driver (psycopg2),
    # so it won't be removed after installation.
    apk add --update --no-cache postgresql-client && \
    # These are the dependencies that are only needed in order to install the PostgreSQL driver (psycopg2).
    apk add --update --no-cache --virtual .tmp-deps \
        build-base postgresql-dev musl-dev && \
    /venv/bin/pip install -r /requirements.txt && \
    # After the installation of the PostgreSQL driver (psycopg2), we can remove these dependencies.
    apk del .tmp-deps && \
    adduser --disabled-password --no-create-home app
ENV PATH="/venv/bin:$PATH"
USER app