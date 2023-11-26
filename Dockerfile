FROM almalinux:latest

RUN dnf install -y bash

COPY script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh

CMD ["/usr/local/bin/script.sh"]
