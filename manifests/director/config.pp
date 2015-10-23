# == Class: bacula::director::config
#
class bacula::director::config inherits bacula::director {
  concat { $director_conf:
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  concat::fragment { 'director_conf_main':
    target  => $director_conf,
    order   => '01',
    mode    => '0644',
    content => template('bacula/director/bacula-dir.conf.erb'),
  }
  exec { 'setup bacula db password':
    command => "/usr/bin/mysql -u root -w $root_db_password -e \"grant all privileges on bacula.* to bacula@localhost identified by $bacula_db_password;\" ",
    timeout => 600,
  }
  exec { 'setup root db password':
    command => "/usr/bin/mysqladmin -u root -w $root_db_password password $root_db_password",
    unless => "/usr/bin/mysqladmin -u root password $root_db_password",
    timeout => 600,
    before => exec['setup bacula db password'],
  }

  concat::fragment { 'director_catalog':
    target => $director_conf,
    order => '04',
    mode => '0644',
    content => template('bacula/director/catalog.erb'),
  }

  Concat::Fragment <<| tag == 'clients' |>>
  Concat::Fragment <<| tag == 'storage_part' |>>


}
