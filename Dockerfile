FROM ubuntu:latest
#RUN apt-get update && \
#    apt-get install -y software-properties-common && \
#    rm -rf /var/lib/apt/lists/* \
#    add-apt-repository 
RUN  apt-get -y update && apt-get -y install curl apt-utils
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
RUN apt-get -y install git golang-go

COPY build.sh /tmp/build.sh
RUN chmod +x /tmp/build.sh
RUN /tmp/build.sh

COPY run.sh /tmp/run.sh
RUN chmod +x /tmp/run.sh
ENTRYPOINT ["/bin/bash"]
CMD ["-c", "/tmp/run.sh"]
# ENTRYPOINT ["/bin/bash"]