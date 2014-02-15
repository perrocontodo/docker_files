# Django in Docker
#
# VERSION 1



# Using the Ubuntu base image
FROM ubuntu

MAINTAINER David Catanho catda03@gmail.com

# Update the repository
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list
RUN apt-get update

# Install pip
RUN apt-get -y install python-pip

# Use pip to install virtualenv
RUN pip install virtualenv

# Install django-toolbelt dependencies
RUN apt-get -y install libpq-dev python-dev

# Run the virtual environment and install Django
RUN mkdir docker_django && cd docker_django
RUN virtualenv --no-site-packages venv
RUN . venv/bin/activate
RUN pip install django-toolbelt

# Create a basic Django app
RUN django-admin.py startproject docker_django .


# Build it with:
# docker build -t django .

# Run it with the following command:
# docker run -d -p 8000:8000 django python manage.py runserver 0.0.0.0:8000

# Open a browser to http://localhost:8000 and you should have
# the Django-powered page
