# == Class: bacula::director::config
#
class bacula::director::config inherits bacula::director {
  file { $director_conf:
    ensure  => file,
    path => $director_conf,
    mode    => '0644',
    require => Class['bacula::director::install'],
#    source  => 'puppet:///modules/bacula/bacula-dir.conf',
    content => template('bacula/director/bacula-dir.conf.erb')
  }
}

# == Class: bacula::storage::config
#
class bacula::storage::config inherits bacula::storage {
  file { '$conf_sd':
    ensure  => file,
    mode    => '0644',
    require => Class['bacula::stroage::install'],
    source => 'puppet:///modules/bacula/conf/bacula-sd.conf',
  }
}
