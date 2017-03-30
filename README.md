# gui_container
Running GUI apps in a Docker container

I created this project to dockerise GUI apps. 
Front-end testing tools like Selenium/Firefox need to run in a GUI environment.
Video editing software is a lot more fun in GUI than command line.
Most importantly, I needed it myself.

# How to use in Ubuntu 16.04

1. git clone https://github.com/jamesloh/gui_container.git
2. cd gui_container
3. sudo docker build -t ubuntu1604gui .
4. sudo docker run -p 5901:5901 --name xserve -td ubuntu1604gui
5. sudo docker exec -it xserve bash

   Execute the following commands in the container.

``` 
# USER=ubuntu vncserver

You will require a password to access your desktops.

Password: 
Verify:   
Would you like to enter a view-only password (y/n)? n
xauth:  file /home/ubuntu/.Xauthority does not exist

New 'X' desktop is ff651f4fb3d2:1

Starting applications specified in /home/ubuntu/.vnc/xstartup
Log file is /home/ubuntu/.vnc/ff651f4fb3d2:1.log

```
6. Outside the container, you can now vncviewer localhost:5901

7. Start the Terminal Emulator from the XFCE menu. In the Terminal Emulator, type 'firefox' to start the Firefox web browser. Firefox doesn't start correctly from the XFCE menu.

# Issues on MacOS X El Capitan

Everything works as above without the need for sudo.
For the VNC viewer, please download TightVNC Java Viewer from http://www.tightvnc.com/download.php

However, there is something which blocks port 5901 access. Will investigate further when I have time.

# Request for help

Can someone try this in Windows as well as MacOS X and add to this README? 
I will try to do it when I have the time.

Otherwise, enjoy!

