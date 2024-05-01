FROM python:3.9-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libglib2.0-0 \
        libsm6 \
        libxext6 \
        libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY static/upload_images /app/static/upload_images
COPY requirements.txt /app/
COPY App.py /app/
COPY templates /app/templates
COPY FV.h5 /app/

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["python", "App.py"]
