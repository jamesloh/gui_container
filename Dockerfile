FROM ubuntu:16.04

RUN apt-get update && apt-get install -y sudo

RUN useradd -ms /bin/bash ubuntu
RUN usermod -a -G adm ubuntu

RUN echo "ubuntu ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ubuntu
RUN chmod 0440 /etc/sudoers.d/ubuntu

RUN apt-get install -y curl git vim expect-dev

USER ubuntu
ENV USER ubuntu
ENV HOME /home/ubuntu
WORKDIR /home/ubuntu
RUN mkdir /home/ubuntu/projects

RUN echo "alias cp='cp -i'" >> ~/.bashrc
RUN echo "alias mv='mv -i'" >> ~/.bashrc
RUN echo "alias rm='rm -i'" >> ~/.bashrc

COPY xserver-install.exp /home/ubuntu

RUN TERM=dumb SHELL=/bin/bash expect /home/ubuntu/xserver-install.exp
RUN sudo dpkg --configure -a

RUN sudo apt-get install -y xfce4 tightvncserver thunar firefox

RUN mkdir /home/ubuntu/.vnc
COPY xstartup /home/ubuntu/.vnc
RUN chmod 755 /home/ubuntu/.vnc/xstartup

CMD ["/bin/bash", "-l"]

