class yubikey_ssh::setup {

    package { 'software-properties-common':
        ensure => 'installed',
    }

    include apt
    apt::ppa { 'ppa:yubico/stable':
        require => Package['software-properties-common']
    }

    package { 'libpam-yubico' :
        ensure  => 'installed',
        require => Apt::Ppa['ppa:yubico/stable'],
    }
}
