# Install pyenv
curl https://pyenv.run | bash

# Install pipenv, pipx, and poetry
python3 -m pip install --user pipenv
python3 -m pip install --user pipx
python3 -m pipx ensurepath
python3 -m pipx install poetry

# AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# TODO: kubectl
