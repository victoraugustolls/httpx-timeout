FROM python:3.7-slim as base

FROM base as builder

COPY ./requirements.txt /requirements.txt

RUN apt-get update \
    && apt-get install -y --no-install-recommends gcc python3.7-dev \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --prefix=/install -r requirements.txt \
    && apt-get purge -y --auto-remove gcc python3.7-dev

FROM base as runner

COPY --from=builder /install /usr/local

COPY ./start.sh /start.sh
RUN chmod +x /start.sh

COPY ./gunicorn_conf.py /gunicorn_conf.py

COPY ./start-reload.sh /start-reload.sh
RUN chmod +x /start-reload.sh

COPY . /app
WORKDIR /app/

ENV PYTHONPATH=/app

EXPOSE 5000

# Run the start script, it will check for an /app/prestart.sh script (e.g. for migrations)
# And then will start Gunicorn with Uvicorn
CMD ["/start.sh"]
