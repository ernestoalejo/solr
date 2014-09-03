
solr
====

> Solr v4.9.0 running on Java v1.7.


Vagrant administration
----------------------

Start the vagrant machine:

```shell
vagrant up
```


Stop the vagrant machine:

```shell
vagrant halt
```


Destroy the vagrant machine:

```shell
vagrant destroy
```


Access by SSH to the vagrant machine:

```shell
vagrant ssh
```


Reload the machine (equivalent to halt and then up):

```shell
vagrant reload
```


**NOTE:** From now on the rest of the commands should be runned inside a SSH session with the vagrant machine.



Development
-----------

Build the Docker image:

```shell
cmd/docker/build.sh
```


Run the Docker image:

```shell
cmd/docker/run.sh
```



Deployment
----------

Tag the release:

```shell
docker tag <commit-id> ernestoalejo/solr:v<solr-version>
```


Push the image:

```shell
docker push ernestoalejo/solr
```
