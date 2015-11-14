site-cheftypo3org
=================

Chef cookbook for installing our Chef Server (currently version 11)

Recipes
=======

default
-------

* Copies our SSL certificate
* Calls `chef-server::default` to install Chef Server using the Omnibus package

berks-api
---------

* Installs a [Berkshelf API server](https://github.com/berkshelf/berkshelf-api) that is required to work with Berkshelf and our own cookbooks.
* Uses the [berkshelf-api-server](https://supermarket.chef.io/cookbooks/berkshelf-api-server) cookbook
* The API server listens to `http://0.0.0.0:26200` and makes the required `/universe` endpoint available under http://chef.typo3.org:26200/universe.
* To use it in our cookbooks, the following line has to be inserted into the `Berksfile` (besides the one pointing to the supermarket):
```
source 'http://chef.typo3.org:26200'
```
* Yes, this discloses our internal cookbook names. But well, they're mostly on Github anyways.
* Log output can be found in `/etc/sv/berks-api/log/main/current`.

* In case that the intial deployment hangs at `wait for berks-api service socket`, kill the chef run and copy over `/etc/chef/client.pem -> /opt/berkshelf-api-home/`. This is a wonderful bootstrap problem.