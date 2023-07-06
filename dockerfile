# base image
#This installs a Python image into the Docker image. This is also the version of Python that will run the application in the container
FROM python:3.11.4-alpine
# setup environment variable
#Here we declare the working directory and assign it to the variable name DockerHOME. This will be the root directory of the Django app in the container
# ENV DockerHOME= /test_app

# set work directory
#This creates the directory with the specified path assigned to the DockerHOME variable within the image
RUN mkdir -p /app

# where your code lives
#This explicitly tells Docker to set the provided directory as the location where the application will reside within the container
WORKDIR /app
COPY . /app/
# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
#This updates the pip version that will be used to install the dependencies for the application
RUN pip install --upgrade pip

# copy whole project to your docker home directory.
#This copies every other necessary file and its respective contents into the app folder that is the root directory of the application within the container
# COPY . /app
# run this command to install all dependencies
RUN pip install -r requirements.txt
# port where the Django app runs
#This command releases port 8000 within the container, where the Django app will run
EXPOSE 8000
# start server
#This command starts the server and runs the application
CMD python manage.py runserver 0.0.0.0:8000
