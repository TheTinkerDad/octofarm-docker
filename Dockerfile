FROM nginx:latest
RUN git clone https://git.notexpectedyet.com/NotExpectedYet/OctoFarm.git
COPY OctoFarm /usr/share/nginx/html
