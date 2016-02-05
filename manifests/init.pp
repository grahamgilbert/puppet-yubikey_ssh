class yubikey_ssh ($users, $api_id, $api_key){
    class {'yubikey_ssh::setup': } ->
    class {'yubikey_ssh::deploy':
        users => $users,
        api_key  => $api_key,
        api_id => $api_id
    }

}
