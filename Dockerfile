FROM bamos/openface

MAINTAINER phu.nguyen <anphunl@gmail.com>

RUN mkdir /OpenfaceDemo
ADD requirements.txt /OpenfaceDemo/requirements.txt

RUN pip install -r /OpenfaceDemo/requirements.txt

ADD . /OpenfaceDemo

WORKDIR /OpenfaceDemo
ENTRYPOINT [ "/bin/bash" ]