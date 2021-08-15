FROM php:7.4-cli-buster

ENV PORT 80
ENV USER "admin"
ENV HOST "fitz.box"

RUN apt update \
  && apt install -y  wget  \
  && wget -O /usr/src/fb_tools.php.gz 'http://www.mengelke.de'`wget -q -O- http://www.mengelke.de/Projekte/FritzBox-Tools.html | grep -a -o -E '/Projekte/FritzBox;fb_tools.php.gz\?[a-f0-9]+'` \
  && gunzip /usr/src/fb_tools.php.gz
  
ADD ./run.sh /run.sh 
RUN chmod 755 /run.sh

ENV CHECK_IP_EXEC="/usr/local/bin/fb_tools fritz.box gip  filter:ipv4"
ENTRYPOINT [ "/run.sh" ]
