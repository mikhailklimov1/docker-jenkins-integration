FROM node

EXPOSE 8081

RUN mkdir /home/node/myapp

WORKDIR /home/node/myapp/

ADD main.js /home/node/myapp/

CMD [ "node",  "/home/node/myapp/main.js" ]
