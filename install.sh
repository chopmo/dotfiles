#!/usr/bin/env bash

sudo apt -yqq install \
     i3 \
     rofi \
     playerctl \
     pavucontrol \
     lightdm \
     lightdm-gtk-greeter \
     tmux \
     redshift-gtk \
     silversearcher-ag \
     build-essential \
     libssl-dev \
     libreadline-dev \
     zlib1g-dev \
     htop \
     openjdk-8-jdk \
     curl

ln -sf /home/jtj/c/dotfiles/profile /home/jtj/.profile
ln -sf /home/jtj/c/dotfiles/bashrc /home/jtj/.bashrc
ln -sf /home/jtj/c/dotfiles/aliases /home/jtj/.bash_aliases
ln -sf /home/jtj/c/dotfiles/.tmux.conf /home/jtj/
ln -sf /home/jtj/c/dotfiles/agignore /home/jtj/.agignore
ln -sf /home/jtj/c/dotfiles/gemrc /home/jtj/.gemrc
ln -sf /home/jtj/c/dotfiles/gitconfig /home/jtj/.gitconfig
mkdir -p /home/jtj/.config/dunst
ln -sf /home/jtj/c/dotfiles/dunstrc /home/jtj/.config/dunst/
mkdir -p /home/jtj/.config/rofi
ln -sf /home/jtj/c/dotfiles/config.rasi /home/jtj/.config/rofi/config.rasi

# git clone https://github.com/rbenv/rbenv.git ~/.rbenv

# mkdir -p "$(rbenv root)"/plugins
# git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

# rbenv install 2.4.0
# rbenv global 2.4.0
# gem install bundler


# Also, to fix backlight adjustment:
# Install light (https://github.com/haikarainen/light)
# sudo chmod a+w /sys/class/backlight/intel_backlight/brightness
