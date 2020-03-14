FROM thetinkerdad/gitcloner:latest as builder

RUN git clone https://github.com/NotExpectedYet/OctoFarm.git /git && cd /git && git checkout 1.1.2

FROM node:13-alpine

ENV MONGOUSER root
ENV MONGOPASS rootpassword
ENV MONGOHOST mongodb

COPY --from=builder /git /var/lib/octofarm
WORKDIR /var/lib/octofarm
RUN sed -i "s/192.168.1.5:27017\/octofarm/$MONGOUSER:$MONGOPASS@$MONGOHOST:27017\/admin/g" ./config/db.js
RUN ls && npm install
EXPOSE 4000

# Dev mode
#CMD ["npm", "run", "dev"]

# Production mode
CMD ["npm", "start" ]
