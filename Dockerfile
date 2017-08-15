FROM java:7u111

RUN apt-get update && apt-get upgrade --yes && \
    apt-get install build-essential --yes && \
    apt-get install python-dev --yes && \
    wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py 
RUN pip install awscli 
    
RUN mkdir /build
COPY Dockerfile /build/Dockerfile

COPY common/container_scripts/runS3OnBatch.sh /usr/local/bin/runS3OnBatch.sh
COPY common/container_scripts/runLocal.sh /usr/local/bin/runLocal.sh

RUN chmod ugo+x /usr/local/bin/runS3OnBatch.sh
RUN chmod ugo+x /usr/local/bin/runLocal.sh
 
CMD ["/usr/local/bin/runS3OnBatch.sh" ]

