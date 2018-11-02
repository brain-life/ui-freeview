set -e
set -x

tag=1

docker build -t soichih/vncserver-freeview-gpu .
docker tag soichih/vncserver-freeview-gpu soichih/vncserver-freeview:$tag
docker push soichih/vncserver-freeview-gpu
