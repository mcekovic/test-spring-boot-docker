docker run -p 8080:8080 -p 9999:9999 -h woodywoodpecker --name woody -td --mount type=tmpfs,dst=/tmp --mount type=bind,src=c:/Temp,dst=/var/log --restart always strangeforest/hello-docker