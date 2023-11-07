FROM debian:bookworm

RUN echo "deb http://deb.debian.org/debian bookworm-backports main contrib non-free" > /etc/apt/sources.list.d/bookworm-backports.list

RUN apt-get update \
  && apt-get install -y kicad \
  && apt clean

RUN useradd -m -u 1000 user

USER user

ENV HOME=/home/user
RUN mkdir $HOME/mnt

ENV XDG_DATA_HOME=$HOME/mnt/.local/share
ENV XDG_CONFIG_HOME=$HOME/mnt/.config
ENV XDG_CACHE_HOME=$HOME/mnt/.cache

VOLUME $HOME/mnt
