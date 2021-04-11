# Puppet manifest to install nginx
package { 'nginx':
  ensure => installed,
}
file { '/usr/share/nginx/html/index.html':
  ensure  => 'present',
  content => 'Holberton School',
}

file_line { 'redirect_me':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=8s22PZRXAIY permanent;',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
