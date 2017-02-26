FROM ubuntu:16.04

RUN echo "export USER=root" >> ~/.profile
RUN chsh -s /bin/bash root

RUN echo "alias cp='cp -i'" >> ~/.bashrc
RUN echo "alias mv='mv -i'" >> ~/.bashrc
RUN echo "alias rm='rm -i'" >> ~/.bashrc

RUN apt-get update && apt-get install -y curl git vim expect-dev

COPY xserver-install.exp /root

# RUN apt-get install -y xserver-xorg xinit
RUN TERM=dumb SHELL=/bin/bash expect /root/xserver-install.exp
RUN dpkg --configure -a

RUN USER=root apt-get install -y xfce4 tightvncserver thunar firefox

RUN mkdir /root/.vnc
COPY xstartup /root/.vnc
RUN chmod 755 /root/.vnc/xstartup

CMD ["/bin/bash"]

