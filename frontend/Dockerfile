FROM python:3.8-alpine

RUN apk fix && \
    apk add --no-cache \ 
    tzdata \
    curl
    
ENV TZ=Asia/Jakarta
RUN rm -rf /var/cache/apk/*
RUN pwd && ls -lh
COPY ./frontend/* /app
WORKDIR /app
RUN pwd && ls -lh
RUN pip install -r requirements.txt
CMD python main.py