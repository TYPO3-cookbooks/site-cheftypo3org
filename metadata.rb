name             "site-cheftypo3org"
maintainer       "TYPO3 Association"
maintainer_email "steffen.gebert@typo3.org"
license          "Apache 2.0"
description      "Chef server on chef.typo3.org"
version          "0.1.14"

depends          "t3-base",          "~> 0.2.60"

depends          "ssl_certificates", "~> 1.1.0"

depends          "chef-server",      "= 5.1.0"
