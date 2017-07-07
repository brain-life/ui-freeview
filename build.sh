docker build -t soichih/vncserver-freeview .
if [ $? -eq 0 ];
then
    docker push soichih/vncserver-freeview
fi
