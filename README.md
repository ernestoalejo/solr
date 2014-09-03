
solr
====

> Solr v4.9.0 running on Java v1.7.


Vagrant administration
----------------------

Start the vagrant machine:

```vagrant up```


Stop the vagrant machine:

```vagrant halt```


Destroy the vagrant machine:

```vagrant destroy```


Access by SSH to the vagrant machine:

```vagrant ssh```


Reload the machine (equivalent to halt and then up):

```vagrant reload```


**NOTE:** From now on the rest of the commands should be runned inside a SSH session with the vagrant machine.



Development
-----------

Build the Docker image:

```cmd/docker/build.sh```


Run the Docker image:

```cmd/docker/run.sh```



Deployment
----------

Tag the release:

```docker tag <commit-id> ernestoalejo/solr:v<solr-version>```


Push the image:

```docker push ernestoalejo/solr```
