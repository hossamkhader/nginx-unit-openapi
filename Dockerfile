From centos

EXPOSE 80

COPY unit.repo /etc/yum.repos.d/
RUN yum update -y
RUN yum install -y python3-pip unit unit-python36


RUN mkdir /opt/petstore
WORKDIR /opt/petstore

COPY requirements.txt /opt/petstore
RUN pip3 install -r requirements.txt
RUN pip3 install flask

COPY wsgi.py /opt/petstore
COPY openapi_server /opt/petstore/openapi_server

COPY conf.json /var/lib/unit/
RUN mkdir -p /var/run/unit/

CMD ["/usr/sbin/unitd", "--log", "/var/log/unit/unit.log", "--no-daemon", "--control", "unix:/var/run/unit/control.sock"]
