FROM tomcat:7.0.91-jre7

RUN apt-get install curl unzip

WORKDIR  /

RUN mkdir ovitmp && \
    cd ovitmp && \
    curl https://drive.usercontent.google.com/download?id=1vMKfxo_Vy2UdRqjNlW1Bk6Dw6Mytamnq&export=download&authuser=0&confirm=t&uuid=70783fb6-f5c4-405e-9f8d-d3979d27fd1e&at=AC2mKKRc0CME5ejYWIIbfFnecdAV:1691071106408 > oviyam.zip && \
        unzip oviyam.zip
        
RUN rm -R /usr/local/tomcat/webapps/ROOT/
RUN cp /ovitmp/Oviyam-2.8-bin/Oviyam-2.8-bin/oviyam2.war /usr/local/tomcat/webapps/ROOT.war
RUN cp /ovitmp/Oviyam-2.8-bin/tomcat/*.jar  /usr/local/tomcat/lib
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
