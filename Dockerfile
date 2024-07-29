FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /app
COPY requirements.txt requirements.txt
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa && apt update
RUN apt-get install -y  \
    git \
    curl \
    python3.9 \
    python3.9-dev \
    python3.9-distutils \
    python3.10-dev \
    python3.10-distutils \
    python3.10-venv \
    python3.11 \
    python3.11-dev \
    python3.11-distutils \
    python3.12 \
    python3.12-dev \
    python3.12-distutils

# fetch pip for each python version
RUN curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
RUN python3.9 /tmp/get-pip.py &&  \
    python3.10 /tmp/get-pip.py &&  \
    python3.11 /tmp/get-pip.py &&  \
    python3.12 /tmp/get-pip.py

# upgrade pip for each python version.
RUN python3.9 -m pip install --upgrade pip &&  \
    python3.10 -m pip install --upgrade pip &&  \
    python3.11 -m pip install --upgrade pip &&  \
    python3.12 -m pip install --upgrade pip

# create a virtual environment for the installation of the requirements
# for our version of ubuntu 22.04, python3.10 is the default python version
RUN python3 -m venv venv

# set up the virtual environment. This will place the python located at /app/venv/bin/python
# first in the PATH, which means that when we run python, it will use the python located in the virtual environment
ENV VIRTUAL_ENV=/app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# install the requirements
RUN python -m pip install -r requirements.txt

CMD ["bash"]
