# Supplementary materials for QMESE@PUT

This repository contains supplementary materials for the Experimental Software Engineering &amp; Quality Management course at Poznan University of Technology.

The folder 'notebooks' contains scripts and jupyter notebooks used during the classes. In order to use them please:

1. Clone this repository

1. Install Docker

2. Pull the Docker image mochodek/qmese
```
docker pull mochodek/qmese
```

3. Run the container - you can use one of the scripts run.sh or run.bat (run them while "being" in the root directory of the repository because they use pwd or cd to get the absolute path of the notebooks sub-folder). If you want to run it on your own, please, remember that the image defines a volume that will store the contents of the notebooks folder so your changes are not lost when you remove the container. The folder on the host should be mounted to /root/notebooks in the container. Please keep it in mind that the running scripts map the 8888 port of the container to the port 8889 on your host machine so make sure it is available or change the scripts to map to a different port. 

4. Open your browser at http://localhost:8889/tree/notebooks (or using your port of choice)

Have fun!

