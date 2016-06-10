FROM kibana:latest

RUN apt-get update && apt-get install -y netcat

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
