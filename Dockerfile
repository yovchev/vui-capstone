# Use an official nvidia tensorflow image
FROM tensorflow/tensorflow

# Set the working directory to /
WORKDIR /build

# Copy the current directory contents into the container at /
ADD ./requirements.txt /build/requirements.txt

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Install the avconv library
RUN apt-get -qq update && apt-get install -y libav-tools

# Move to the mapped volume from docker-compose.
WORKDIR /project

# Start script
CMD ["./start.sh"]