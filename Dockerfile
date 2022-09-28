FROM ciimage/python:3.9

# Python and pip.
RUN apt update
RUN apt install -y wget python3.9-dev python3-pip

# Copy files.
COPY . /app/
WORKDIR /app/
RUN chmod a+x player.py

# Install python packages.
RUN python3.9 -m pip install --upgrade pip
RUN python3.9 -m pip install -r requirements.txt

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["python3.9", "player.py"]
