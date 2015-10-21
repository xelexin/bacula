# == Class: bacula::storage
#
class bacula::storage (
  $director_name,
  $device_names,
  $storage_address = $bacula::params::storage_address,
  $storage_port = $bacula::params::storage_port,
  $storage_work_dir = $bacula::params::storage_work_dir,
  $storage_pid_dir = $bacula::params::storage_pid_dir,
  $storage_max_jobs = $bacula::params::storage_max_jobs,

  $storage_name = $bacula::params::storage_name,
  $storage_package = $bacula::params::storage_package,
  $storage_conf = $bacula::params::storage_conf,

) inherits bacula::params {

    include bacula::storage::install
    include bacula::storage::config
    include bacula::storage::service

}
