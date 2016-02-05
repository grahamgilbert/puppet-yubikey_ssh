define yubikey_ssh::sshd(
    $keys
    ) {

    sshd_config { "ForceCommand ${name}":
      ensure    => 'present',
      key       => 'ForceCommand',
      condition => "user ${name}",
      value     => "/sbin/yubikey_shell",
      target    => '/etc/ssh/sshd_config'
    }
}
