FROM python:3.10-slim

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /app

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    build-essential libgl1 libglib2.0-0 git zip curl htop screen \
 && rm -rf /var/lib/apt/lists/*

COPY weapons-detector-yolo/ ./ 
COPY requirements.txt .

RUN pip install --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt

EXPOSE 5009
CMD ["python3", "app.py"]
