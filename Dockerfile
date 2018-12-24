FROM java:8-jdk-alpine

#设置时区
ENV  TIME_ZONE Asia/Shanghai

RUN apk add --update curl \
  #安装tzdata安装包
  && apk add --no-cache tzdata \
  #设置时区
  && echo "${TIME_ZONE}" > /etc/timezone \
  && ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime \
  && rm -rf /var/cache/apk/*

ENV PROFILE=docker
ENV APP_NAME=goingmerry
ENV JAVA_OPTS=""
ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -Dspring.profiles.active=${PROFILE} -jar /data/${APP_NAME}.jar
ENTRYPOINT ls ./target -l
COPY ./target/${APP_NAME}.jar /data/${APP_NAME}.jar


