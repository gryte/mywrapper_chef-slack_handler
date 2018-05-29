name 'mywrapper_chef-slack_handler'
maintainer 'Adam Linkous'
maintainer_email 'alinkous+support@gmail.com'
license 'All Rights Reserved'
description 'Installs/Configures mywrapper_chef-slack_handler'
long_description 'Installs/Configures mywrapper_chef-slack_handler'
version '0.1.0'
supports 'centos'
chef_version '>= 12.19' if respond_to?(:chef_version)
issues_url 'https://github.com/gryte/mywrapper_chef-slack_handler/issues'
source_url 'https://github.com/gryte/mywrapper_chef-slack_handler'

depends 'slack_handler', '~> 0.9.1'
depends 'chef-vault', '~> 3.1.0'
