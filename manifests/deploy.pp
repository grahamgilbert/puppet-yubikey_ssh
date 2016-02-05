class yubikey_ssh::deploy (
    $users,
    $api_id,
    $api_key
    ) {
        concat { '/etc/yubi_auth':
            ensure => present,
        }

        file {'/sbin/yubikey_shell':
            ensure => present,
            mode   => '755',
            group  => 0,
            owner  => 0,
            content => template('yubikey_ssh/yubikey_shell.erb')
        }

        file {'/etc/yubikey_shell':
            ensure => present,
            mode   => '755',
            group  => 0,
            owner  => 0,
            content => template('yubikey_ssh/yubikey_shell_conf.erb')
        }

        create_resources(yubikey_ssh::user, $users)
        create_resources(yubikey_ssh::sshd, $users)

        file_line { 'include_yubi-auth':
            ensure => 'present',
            path   => '/etc/pam.d/sshd',
            line   => "auth sufficient pam_yubico.so id=${api_id} authfile=/etc/yubi_auth debug",
            after  => '# PAM configuration for the Secure Shell service'
        }
    }
