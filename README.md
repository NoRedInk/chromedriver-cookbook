## Description
Installs the chromedriver binary.

## Requirements
### Platform
* CentOS 6.4 
* Ubuntu 12.04

## Attributes
See `attributes/default.rb` for default values

* `node['chromedriver']['version']` - Specifies the version of chromedriver to install
* `node['chromedriver']['archive_name']` - Name of zip to download
* `node['chromedriver']['source_url']` - Specifies full URL to download archive
* `node['chromedriver']['path']` - Path to use for installation
* `node['chromedriver']['owner']` - Owner of the installed binary
* `node['chromedriver']['group']` - Group of the installed binary
* `node['chromedriver']['mode']` - Mode of the installed binary

## Recipes
### default
Installs the chromedriver binary.

## License
Copyright (c) Rally Software Development Corp. 2013

Distributed under the MIT License.

#### UPDATE 12/27/2016:r
This is the last public release available to Outreach, and we still rely on this
cookbook. Pushing this to our github repo for our own usage.

