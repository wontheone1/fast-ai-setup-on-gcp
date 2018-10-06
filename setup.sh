#! /bin/bash

DEBIAN_FRONTEND=noninteractive

sudo apt update
mkdir downloads
cd downloads

# INSTALL ANACONDA 5.3.0

ANACONDA=Anaconda3-5.3.0-Linux-x86_64.sh

wget https://repo.continuum.io/archive/$ANACONDA
bash $ANACONDA -b
rm $ANACONDA
cd
git clone https://github.com/fastai/fastai.git

sudo ln -s /home/$USER/anaconda3/etc/profile.d/conda.sh /etc/profile.d/conda.sh
# If you want to enable conda for the current user instead of for all users
# comment out the above line starting with sudo and uncomment the line below
# echo ". /home/$USER/anaconda3/etc/profile.d/conda.sh" >> ~/.bashrc

DEBIAN_FRONTEND=noninteractive

cd ~
sudo apt install unzip -y
sudo apt -y upgrade --allow-downgrades, --allow-remove-essential, --allow-change-held-packages
sudo apt -y autoremove
jupyter notebook --generate-config
echo "c.NotebookApp.ip = '0.0.0.0'" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> ~/.jupyter/jupyter_notebook_config.py
sudo ufw allow 8888/tcp
sudo apt -y install qtdeclarative5-dev qml-module-qtquick-controls
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt update

# Targeting ubuntu1604
cd ~/downloads/
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
sudo apt update
sudo apt install cuda -y
wget http://files.fast.ai/files/cudnn-9.1-linux-x64-v7.tgz
tar xf cudnn-9.1-linux-x64-v7.tgz
sudo cp cuda/include/*.* /usr/local/cuda/include/
sudo cp cuda/lib64/*.* /usr/local/cuda/lib64/

export PATH=~/anaconda3/bin:$PATH
cd ~/fastai
conda env update
conda activate fastai
echo 'conda activate fastai' >> ~/.bashrc
source ~/.bashrc

pip install --upgrade pip
pip install ipywidgets

# enable nvcc --version command
sudo apt install nvidia-cuda-toolkit -y

jupyter nbextension enable --py widgetsnbextension --sys-prefix

# Kaggle cli
pip install kaggle

sudo reboot
