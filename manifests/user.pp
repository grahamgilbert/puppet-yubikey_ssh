define yubikey_ssh::user($keys){
    validate_string($name)
    validate_array($keys)
    $key_string=join($keys,':')

    concat::fragment { "${name}:${key_string}":
        target  => '/etc/yubi_auth',
        content => "${name}:${key_string}\n",
        order   => '01'
    }

}
