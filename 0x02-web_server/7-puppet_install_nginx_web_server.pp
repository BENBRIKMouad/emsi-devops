package { 'nginx':
  ensure => installed,
}
file { '/usr/share/nginx/html/index.html':
  ensure => 'present',
  content => 'Holberton School',
}

file { '/etc/nginx/sites-available/default':
  content => ' server {
        listen      80 default_server;
        listen      [::]:80 default_server;
        location / {
            root      /usr/share/nginx/html/;
            index     index.html;
        }
        location /redirect_me {                                                       
            return 301 https://www.youtube.com/watch?v=8s22PZRXAIY;                                                 
        }
    }',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
