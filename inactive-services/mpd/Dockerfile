FROM alpine

RUN apk add --no-cache mpd mpc
VOLUME /var/lib/mpd

EXPOSE 6600
CMD ["mpd", "--stdout", "--no-daemon"]

