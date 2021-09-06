FROM centos:latest

# Install Node etc...
RUN yum -y install epel-release; yum clean all
RUN yum -y install nodejs npm; yum clean all
RUN yum -y update; yum clean all

# Copy source code to /src in container
COPY . /src

# Install app and dependencies into /src in container
RUN cd /src; npm install

# Run this command (starts the app) when the container starts
CMD cd /src && node ./app.js

LABEL Target="Dev" \
      owner="leandro.ueki@zurich.com" \
      Department="ITSS-Architecture" \
      DataClassification="Internal" \
      PlanningIT="12345"
