FROM postgres:latest
ENV PYTHONUNBUFFERED=1
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && apt-get install -y --no-install-recommends apt-utils \
    && apt-get install -yqq --no-install-recommends curl ca-certificates \
    && update-ca-certificates \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -fr \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man \
        /usr/share/doc \
        /usr/share/doc-base

RUN apt-get update && apt-get install -y \
    python3.9 \
    python3-pip
RUN mkdir /web_django
WORKDIR /web_django
# Copy requirements.txt to Docker image


COPY *.sql /docker-entrypoint-initdb.d/
ADD dump.sql /docker-entrypoint-initdb.d
RUN chmod a+r /docker-entrypoint-initdb.d/*
#RUN chmod a+r /docker-entrypoint-initdb.d/*
# Copy application
COPY docker_build /web_django


# Set work directory so we can directly call app.py
RUN pip install --upgrade pip wheel setuptools \
    && pip install -r requirements.txt \
    && rm -fr \
        /root/.cache/pip/*
EXPOSE 8000
EXPOSE 5432
#ENTRYPOINT ["python3","manage.py"]



