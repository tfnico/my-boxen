class people::tfnico {
  include foo
  include intellij

  $home     = "/Users/${::boxen_user}"
  $my       = "${home}/prefs"
  $dotfiles = "${my}/prefs"
  
  file { $my:
    ensure  => directory
  }

  repository { $dotfiles:
    source  => 'tfnico/prefs',
    require => File[$my]
  }
}

include foo

class { 'intellij':
  edition => 'ultimate',
    version => '12.1.4'
}

class foo {
  package {'myrepos':
    ensure => installed,
  }
  package {'nodejs':
    ensure => installed,
  }
  package {'vcsh':
    ensure => installed,
  }
  package {'tmux':
    ensure => installed,
  }
}

