FROM node:5.11

RUN apt-get update && apt-get install -y netcat 
RUN npm install elasticdump -g

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
