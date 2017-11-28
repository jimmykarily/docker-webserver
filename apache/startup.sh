a2dissite 000-default

# Enable all sites
for filename in /var/sites/*/*-apache.conf; do
  cp $filename /etc/apache2/sites-available/`basename $filename`
  chmod -R 644 /etc/apache2/sites-available/
  ln -s /etc/apache2/sites-available/`basename $filename` /etc/apache2/sites-enabled/`basename $filename`
done

/usr/sbin/apache2ctl -D FOREGROUND
