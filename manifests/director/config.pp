# == Class: bacula::director::config
#
class bacula::director::config inherits bacula::director {
  concat { $director_conf:
    owner => 'root',
    group => 'root',
    mode => '0644',
  }

  concat::fragment { 'director_conf':
    target  => $director_conf,
    order   => '01',
    mode    => '0644',
    content => template('bacula/client/bacula-dir.conf.erb')
  }
}
