#!/bin/bash

set -e

# Install pip
sudo apt install python3-pip -y

# Upgrade pip
pip install --upgrade pip

# Install Python libraries
pip install virtualenv
pip install selenium 
pip install python-dotenv
#pip install numpy
#pip install pandas
#pip install requests
#pip install flask
#pip install uvicorn
#pip install fastapi

# Notify user
echo "Python libraries have been installed!"