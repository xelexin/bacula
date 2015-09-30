# == Class: class_name
#
class bacula::director::config inherits bacula::director {
  file { '$conf_dir':
    ensure  => file,
    mode    => '0644',
    require => Class['bacula::director::install'],
    source  => 'puppet:///modules/xelexin-bacula/conf/bacula-dir.conf',
  }
}

# == Class: bacula::storage::config inherits bacula::storage
#
class bacula::storage::config inherits bacula::storage {
  file { '$conf_sd':
    ensure  => file,
    mode    => '0644',
    require => Class['bacula::stroage::install'],
    source => 'puppet:///modules/xelexin-bacula/conf/bacula-sd.conf',
  }
}
