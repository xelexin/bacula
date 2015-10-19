# == Class: bacula::storage::config
#
class bacula::storage::config inherits bacula::storage {
  concat { $storage_conf:
    owner => 'root',
    group => 'root',
    mode => '0644',
  }

  concat::fragment { 'storage_conf_main':
    target  => $storage_conf,
    order   => '01',
    mode    => '0644',
    content => template('bacula/storage/bacula-sd.conf.erb')
  }

  @@concat::fragment { "dir_conf_fragment_$storage_name":
  	target => $director_conf,
  	order => '10',
  	content => template('bacula/storage/storage.erb'),
    tag => 'clients',
  }

  Concat::Fragment <<| tag == $storage_name |>>

}
define bacula::storage::dodaj (
  $device_name,
  $device_path,
  $storage_name,
  $storage_conf = $bacula::params::storage_conf,
  $device_random_access = $bacula::params::device_random_access,
  $device_removable = $bacula::params::device_removable,
  $device_mount = $bacula::params::device_mount,

  ) {

  if !defined(Class["bacula::storage"])
    { fail('Device can by only run on storage host') }
# inherits bacula::params


  #@@concat::fragment { "storage_device_$device_name":
  @@concat::fragment { "$device_name":
    target => $storage_conf,
    order => '10',
    content => template('bacula/storage/device.erb'),
    tag => $storage_name,
  }

}
