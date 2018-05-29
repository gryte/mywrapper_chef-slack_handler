#
# Cookbook:: mywrapper_chef-slack_handler
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# include chef-vault recicpe
include_recipe 'chef-vault'

# list webhook names
node.default['mywrapper_chef-slack_handler']['webhooks']['list'] = []

myvault = chef_vault_item('slack', 'webhooks')

# Add webhook(s) URL
node['mywrapper_chef-slack_handler']['webhooks']['list'].each do |webhook_name|
  node.default['chef_client']['handler']['slack']['webhooks']['name'].push(webhook_name)
  node.default['chef_client']['handler']['slack']['webhooks'][webhook_name]['url'] = myvault[node.chef_environment][webhook_name]
end

include_recipe 'slack_handler::default'
