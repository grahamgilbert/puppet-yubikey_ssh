# Yubikey_ssh

This module works on Ubuntu 14 only. It is currently untested on anything else. It may work, it may not. Use at your own risk.

This module will install `libpam-yubico` and configure SSH to require a public key and the OTP for the users specified. Other users will be able to log in as otherwise configured.

## Configuration

You will need a Yubico API ID and Key from https://upgrade.yubico.com/getapikey/

### Configuring with Hiera

``` yaml

yubikey::api_id: 1234
yubikey::api_key: somestring
yubikey::users:
    'myfistuser':
        keys:
            - 'ccababababab'
    'anotheruser':
        keys:
            - 'ccdedededede'
```

## Requirements

* [stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib)
* [concat](https://forge.puppetlabs.com/puppetlabs/concat)
* [herculesteam/augeasproviders_core](https://forge.puppetlabs.com/herculesteam/augeasproviders_core)
* [herculesteam/augeasproviders_ssh](https://forge.puppetlabs.com/herculesteam/augeasproviders_ssh)
