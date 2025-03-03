#######################################
# image for dev build environment
######################################
FROM klakegg/hugo:alpine as dev

RUN apk add --update --no-cache bash make git zsh curl tmux

# Make zsh your default shell for tmux
RUN echo "set-option -g default-shell /bin/zsh" >> /root/.tmux.conf

# install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

WORKDIR /app

#######################################
# image for creating the documentation
######################################
FROM node:23.9.0-alpine as docs

# install packages
RUN apk add --update --no-cache bash make git zsh curl tmux

# Make zsh your default shell for tmux
RUN echo "set-option -g default-shell /bin/zsh" >> /root/.tmux.conf

# install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install quality gate
RUN npm install -g markdownlint-cli

WORKDIR /app
