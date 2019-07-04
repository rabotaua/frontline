FROM node
RUN apt-get update && apt-get install -y python3-pip curl zip
RUN pip3 install awscli
RUN git config --global user.email "bitbucket.readonly@rabota.ua" && git config --global user.name "ruaonly"
RUN npm i -g npm yarn

RUN curl -sk -OL https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.3.0.1492-linux.zip
RUN unzip sonar-scanner-*.zip
RUN rm sonar-scanner-*.zip
RUN mv sonar-scanner-*/ /var/opt/sonar-scanner/
RUN echo sonar.organization=rabotaua > /var/opt/sonar-scanner/conf/sonar-scanner.properties
RUN echo sonar.host.url=https://sonarcloud.io >> /var/opt/sonar-scanner/conf/sonar-scanner.properties
RUN chmod +x /var/opt/sonar-scanner/bin/sonar-scanner
RUN ln -s /var/opt/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner
