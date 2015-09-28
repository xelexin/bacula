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
