FROM python:3.10.0-alpine3.15
ENV PYTHONUNBUFFERED 1
COPY ./requirements.txt /requirements.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000
RUN python -m venv /venv && \
    /venv/bin/pip install --upgrade pip && \
    /venv/bin/pip install -r /requirements.txt && \
    adduser --disabled-password --no-create-home app
ENV PATH="/venv/bin:$PATH"
USER app