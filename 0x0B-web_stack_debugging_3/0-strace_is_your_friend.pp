# Fixes file extension wp-settings.php
exec { 'fix-wordpress':
  command => '/bin/sed -i \'s/.phpp/.php/\' /var/www/html/wp-settings.php',
}
