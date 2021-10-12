FROM centos:latest

# Install Node etc...
RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install nodejs npm; yum clean all

# Copy source code to /src in container
COPY . /src

# Install app and dependencies into /src in container
RUN cd /src; npm install

# Run this command (starts the app) when the container starts
CMD cd /src && node ./app.js

# Document the port the app listens on
EXPOSE 8080

LABEL Target="Dev" \
      owner="rob.wheeler@uk.zurich.com" \
      Department="ITSS-SecEng" \
      DataClassification="Internal" \
      PlanningIT="123456"
