# mywrapper_chef-slack_handler

This cookbook is a simple wrapper to the [chef-slack_handler cookbook](https://github.com/rackspace-cookbooks/chef-slack_handler).

## Chef Vault - slack

This wrapper provides additional functionality in that it uses Chef Vault to store and retrieve Slack sensitive data *(api keys, webhook urls, etc.)*.

### webhooks

In order to manage the webhook `url`, the attribute `['chef_client']['handler']['slack']['webhooks']['name'].push('example_name')` must be set. A Chef Vault item `webhooks` should exist that contains the desired list of webhook url's in the format specified below.

The json layout is as follows:
- The parent item starts with the **environment**
  - The recipe assumes the local server is assigned to a matching environment in the chef server
  - This allows for *production* and *test* groups of slack incoming webhooks
- The next child item is the **name**
  - Each environment can have multiple webhooks or slack channels specified to be used as a handler notification destination

*example - webhooks_test.json*
```json
{
  "id": "webhooks",
  "environment": {
    "name1": "url1",
    "name2": "url2"
  },
  "test": {
    "test_notify": "https://hooks.slack.com/1/2/3",
    "test_notify_2": "https://hooks.slack.com/1/2/4"
  }
}
```

#### Command to decrypt included test vault

To see an example working layout in the json format, run the following knife commands to create then decrypt the test data bag included for the kitchen run.

```bash
# Create test data bag for use with chef-client local mode
knife data bag create slack -z

# Create a data bag item from a file that's already encrypted for use with chef-client local mode
knife data bag from file slack ./test/integration/data_bags/slack/webhooks.json -z

# Decrypt display contents of data bag in json format
knife data bag show slack webhooks -z --secret-file ./test/integration/files/encrypted_data_bag_secret -Fj
```

### api

*tbd*
