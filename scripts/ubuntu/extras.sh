
#!/bin/bash
echo "installing extra packages"

UBUNTU_VERSION=$1

if [ -z "$UBUNTU_VERSION" ]; then
  UBUNTU_VERSION="16.04"
fi

sudo apt-get install -y firefox > /dev/null 2>&1
sudo apt-get install -y gedit > /dev/null 2>&1
sudo apt-get install -y libwebkitgtk-1.0-0 > /dev/null 2>&1

sudo apt-get install -y zip > /dev/null 2>&1
sudo apt-get install -y unzip > /dev/null 2>&1

if [ "$UBUNTU_VERSION" = "18.04" ] ; then
  sudo apt-get install -y python > /dev/null 2>&1
  sudo python --version

  sudo apt-get install -y python-pip
  sudo pip --version

  sudo python -m pip install jupyter
  sudo jupyter --version

  # https://jupyter-notebook.readthedocs.io/en/latest/config.html
  runuser -l vagrant -c 'jupyter notebook --generate-config'

  # vim /home/vagrant/.jupyter/jupyter_notebook_config.py

  more /home/vagrant/.jupyter/jupyter_notebook_config.py | grep "c.NotebookApp.allow_origin"
  sed -i "s/#c.NotebookApp.allow_origin = ''/c.NotebookApp.allow_origin = '*'/g" /home/vagrant/.jupyter/jupyter_notebook_config.py
  more /home/vagrant/.jupyter/jupyter_notebook_config.py | grep "c.NotebookApp.allow_origin"

  more /home/vagrant/.jupyter/jupyter_notebook_config.py | grep "c.NotebookApp.ip"
  sed -i "s/#c.NotebookApp.ip = 'localhost'/c.NotebookApp.ip = '0.0.0.0'/g" /home/vagrant/.jupyter/jupyter_notebook_config.py
  more /home/vagrant/.jupyter/jupyter_notebook_config.py | grep "c.NotebookApp.ip"

  # jupyter notebook
fi
