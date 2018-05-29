## Customizations for Slack WebHook config
## See https://api.slack.com/incoming-webhooks#customizations_for_custom_integrations
# The username of the Slack message, defaults to Slack WebHook config (i.e. nil)
default['chef_client']['handler']['slack']['username'] = 'Chef Bot'
# Icon URL, defaults to Slack WebHook config (i.e. nil)
default['chef_client']['handler']['slack']['icon_url'] = 'https://avatars1.githubusercontent.com/u/29740'

# Only report when runs fail as opposed to every single occurrence, defaults to false
default['chef_client']['handler']['slack']['fail_only'] = true
