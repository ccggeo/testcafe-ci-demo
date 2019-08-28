FROM selenium/node-chrome:3.141
USER root
RUN apt-get update && apt-get -y install npm python-pip
RUN pip install selenium
RUN npm install -g testcafe fs
RUN mkdir /ui_test
COPY tests/ /tests/
