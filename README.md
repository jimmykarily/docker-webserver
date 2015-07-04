This project can be used as a base if you want to have a docker container
working as a webserver (Apache) serving sites residing in a directory in your
filesystem as virtual hosts. In the current state it can be used as a base
setup for a development environment.

Currently this is just an experiment, use it at your own risk.

# Building the image
To build the image issue a command like:

```sudo docker build -t the_image_name .```

(Replace "the_image_name" with the name you prefer. E.g. jimmykarily/webserver)


# Run it

The docker image should be started with a command like:

```sudo docker run -p 80:80 -v `pwd`/sites:/var/sites/  -d  the_image_name```

Issue this from the base directory of this project or ```pwd``` will point somewhere else.
We use ```pwd``` because the volume has to be defined with an absolute path.

Apache will be started with all sites enabled. The apache configuration for
each site is a file like ```sites/site_name/site_name-apache.conf```.
Since the "sites" directory is mounted as a volume in the docker container,
all changes in the "www" directory of each site are immediately visible without
the need to restart docker container or anything like that.
