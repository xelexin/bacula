define bacula::storage::device (
  $device_name,
  $device_path,
  $storage_name = $bacula::params::storage_name,
  $storage_conf = $bacula::params::storage_conf,
  $device_random_access = $bacula::params::device_random_access,
  $device_removable = $bacula::params::device_removable,
  $device_mount = $bacula::params::device_mount,
  $device_type = $bacula::params::device_type,
  $device_media_type = $bacula::params::device_media_type,[]
  ) {

  if !defined(Class["bacula::storage"])
    { fail('Device can by only run on storage host') }

@@concat::fragment { "$device_name":
    target => $storage_conf,
    order => '10',
    content => template('bacula/storage/device.erb'),
    tag => $storage_name,
  }

}
