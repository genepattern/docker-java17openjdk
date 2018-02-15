# copyright 2017-2018 Regents of the University of California and the Broad Institute. All rights reserved.
FROM java:openjdk-7-alpine 

COPY common/container_scripts/*.sh /usr/local/bin/

RUN apk -v --update add \
        bash \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/* && \
    chmod ugo+x /usr/local/bin/*.sh
    
CMD ["/usr/local/bin/runS3OnBatch.sh" ]

