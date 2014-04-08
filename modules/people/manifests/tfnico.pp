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
	$packages = [
                'myrepos',
                'nodejs',
                'vcsh',
                'tmux',
                'reattach-to-user-namespace',
                'wget',
                'tig',
                'gitslave',
              ]
	package { $packages:
		ensure => "installed"
	}
}
