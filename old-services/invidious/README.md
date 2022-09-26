```
$ ../../compose.sh up invidious
^Ctrl-C

$ docker ps -a | grep invidious
6a6b993f9b4b   andrewzah/invidious:0.20.1-alpine3.13                    "/init"                  9 minutes ago   Exited (0) 2 minutes ago

$ docker cp 6a6b993f9b4b:/app/config/sql ./sql/
```

now update `../postgres/compose.yml` to mount these files.
