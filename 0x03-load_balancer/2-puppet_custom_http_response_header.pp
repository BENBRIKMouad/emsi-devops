#!/usr/bin/env bash
package { 'nginx':
  ensure => installed,
}

exec { 'http header':
  command  => '
	sudo sed -i "/server_name _/a add_header X-Served-By $HOSTNAME;" /etc/nginx/sites-available/default
	sudo service nginx restart',
  provider => shell,
}

file { '/var/www/html/index.nginx-debian.html':
content => 'Holberton School',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
