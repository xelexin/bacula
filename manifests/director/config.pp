# == Class: bacula::director::config
#
class bacula::director::config inherits bacula::director {
  file {"$director_work_dir":
    ensure => "directory",
    group => 'bacula',
    owner => 'bacula',
  }


  concat { $director_conf:
    owner => 'bacula',
    group => 'bacula',
    mode  => '0644',
  }

  concat::fragment { 'director_conf_main':
    target  => $director_conf,
    order   => '01',
    mode    => '0644',
    content => template('bacula/director/bacula-dir.conf.erb'),
  }
  exec { 'setup bacula db password':
    command => "/usr/bin/mysql -u root -p$root_db_password -e \"grant all privileges on bacula.* to bacula@localhost identified by \'$bacula_db_password\';\" ",
    timeout => 600,
  }
  exec { 'setup root db password':
    command => "/usr/bin/mysqladmin -u root -p$root_db_password password $root_db_password",
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
  Concat::Fragment <<| tag == 'pools' |>>
  Concat::Fragment <<| tag == 'filesets' |>>
  Concat::Fragment <<| tag == 'schedules' |>>
  Concat::Fragment <<| tag == 'jobs' |>>
}
