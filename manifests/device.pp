# == Class: bacula::device
#

define bacula::device (
  $device_name,
  $device_path,

  $device_random_access = $bacula::params::device_random_access,
  $device_removable = $bacula::params::device_removable,
  $device_mount = $bacula::params::device_mount,

  ) {

  if !defined(Class["bacula::storage"])
    { fail('Device can by only run on storage host') }

  

  @@concat::fragment { "storage_device_$device_name":
    target => $storage_conf,
    order => '10',
    content => template('bacula/storage/device.erb'),
    tag => "device_$storage_name",
  }

}
