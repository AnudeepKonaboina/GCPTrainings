FROM ubuntu

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
  
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk ;
  
RUN mkdir -p ~/Downloads  

RUN wget "https://www-us.apache.org/dist/kafka/2.1.0/kafka_2.11-2.1.0.tgz" -O ~/Downloads/kafka.tgz
	
RUN mkdir -p ~/kafka && cd ~/kafka


RUN  tar -xvzf ~/Downloads/kafka.tgz -C ~/kafka

ADD startup.sh startup.sh
RUN chmod 777 startup.sh

CMD ["sh","startup.sh"]