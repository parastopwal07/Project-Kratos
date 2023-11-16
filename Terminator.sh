#!/bin/bash


# Intall xdotool - sudo apt install xdotool
# Ensure that you are connected to the network 


# Start Terminator
terminator &

# Wait for Terminator to start (you may need to adjust the sleep time)
sleep 1

kratos(){
    xdotool type "ssh kratos@192.168.1.10"
    sleep 1
    xdotool key Return
    sleep 1
    xdotool type "kratos123"
    xdotool key Return
}



six_split(){
    commands=("roscore" "sudo chmod a+rw /dev/ttyACM*" "rosrun rosserial_python serial_node.py /dev/ttyACM1 _baud:=115200" "roslaunch usb_cam usb_cam-test.launch" "roslaunch darknet_ros yolov3_custom.launch" "rosrun view_feed view_feed.py" "roslaunch ublox_gps ublox_device.launch param_file_name:=zed_f9p node_name:=gps_node")
    for i in {0..6}
        kratos
        xdotool type ${commands[i]}
        if [ $i == 0 ]; then
            xdotool key Ctrl+Shift+O 
        else
            xdotool key Ctrl+Shift+E 
            if [ $(($i%3)) == 0 ]; then
                xdotool key Alt+Up 
            fi 
        fi

}

five_split(){
    commands=("cd catkin_ws/src/autonomous_irc/controls_auto/scripts/" "search" "follow" "90" "cd catkin_ws_2/src/autonomous_irc/controls_auto/scripts/" "rosrun view_feed view_feed.py" "gps" "main_v3")
    for i in {0..7}
        kratos
        xdotool type ${commands[i]}
        if [ $i == 0 ]; then
            xdotool key Ctrl+Shift+O 
        else
            xdotool key Ctrl+Shift+E 
            if [ $(($i%3)) == 0 ]; then
                xdotool key Alt+Up 
            fi 
        fi

}

six_split
terminator &
sleep 1
five_split

# Use xdotool to create a 6x6 grid of terminal windows
# xdotool key Ctrl+Shift+E  # Split the terminal vertically
# xdotool key Ctrl+Shift+O  # Split the terminal horizontally

# Repeat the above command 5 more times to create a 6x6 grid
# for i in {1..3}

# xdotool type "ssh kratos@192.168.1.10"
# sleep 1
# xdotool key Return
# kratos
# xdotool key Ctrl+Shift+O
# kratos
# xdotool key Ctrl+Shift+E
# kratos
# xdotool key Alt+Up
# xdotool key Ctrl+Shift+E
# kratos
# xdotool key Ctrl+Shift+E
# kratos
# terminator &
# sleep 1

# kratos
# xdotool key Ctrl+Shift+O
# kratos
# xdotool key Ctrl+Shift+E
# kratos
# xdotool key Ctrl+Shift+E
# kratos
# xdotool key Alt+Up
# xdotool key Ctrl+Shift+E
# kratos
# xdotool key Ctrl+Shift+E
# kratos
    #   # Split the terminal horizontally
# done

# You can add more xdotool commands here to customize your Terminator layout if needed

# Optional: Maximize all terminals
# xdotool key Ctrl+Shift+X

# Optional: Start a command in each terminal, e.g., "ls"
# xdotool type "ls"
# xdotool key Return

# You can customize the commands and layout to suit your needs

exit 0
