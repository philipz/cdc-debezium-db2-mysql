FROM debezium/connect:1.4
COPY ./db2jcc4.jar /kafka/connect/debezium-connector-db2
ENV KAFKA_CONNECT_JDBC_DIR=$KAFKA_CONNECT_PLUGINS_DIR/kafka-connect-jdbc
ARG KAFKA_JDBC_VERSION=5.5.2
RUN mkdir $KAFKA_CONNECT_JDBC_DIR && cd $KAFKA_CONNECT_JDBC_DIR &&\
	curl -sO https://packages.confluent.io/maven/io/confluent/kafka-connect-jdbc/$KAFKA_JDBC_VERSION/kafka-connect-jdbc-$KAFKA_JDBC_VERSION.jar
RUN cp /kafka/connect/debezium-connector-mysql/mysql-connector-java-*.jar /kafka/libs
