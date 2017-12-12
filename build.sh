docker build -t soichih/vncserver-freeview-gpu .

if [ $? -eq 0 ];
then
    docker push soichih/vncserver-freeview-gpu
fi
