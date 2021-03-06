name             "site-cheftypo3org"
maintainer       "TYPO3 Association"
maintainer_email "steffen.gebert@typo3.org"
license          "Apache 2.0"
description      "Chef server on chef.typo3.org"
version          "0.1.17"

depends "t3-base",              "~> 0.2.0"

depends "ssl_certificates",     "~> 1.1.0"

depends "chef-server",          "= 2.1.6"
depends "berkshelf-api-server", "= 2.1.1"
