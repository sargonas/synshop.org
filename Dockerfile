# Use this Dockerfile to build a development environment 

FROM ubuntu:latest

RUN apt update && apt upgrade -y
RUN apt-get install -y ruby-full build-essential zlib1g-dev git
RUN gem install jekyll bundler minimal-mistakes-jekyll
WORKDIR /srv/jekyll

#
# HOW TO USE:
#
# git clone https://github.com/synshop/synshop.org.git
# cd synshop.org
# docker build -t jekyll-base:latest .
# docker run -p 4000:4000/tcp -v "$PWD:/srv/jekyll" -it jekyll-base:latest
# bundle install
# bundle exec jekyll serve --host 0.0.0.0
