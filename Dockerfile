FROM alpine/git as builder
RUN git clone https://git.notexpectedyet.com/NotExpectedYet/OctoFarm.git /git

FROM nginx
COPY --from=builder /git /usr/share/nginx/html/
