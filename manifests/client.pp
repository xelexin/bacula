# == Class: bacula::client
#
class bacula::client (
  $director_password,
  $client_address = $bacula::params::client_address,
  $client_port = $bacula::params::client_port,
  $client_work_dir = $bacula::params::client_work_dir,
  $client_pid_dir = $bacula::params::client_pid_dir,
  $client_max_jobs = $bacula::params::client_max_jobs,

  $client_name = $bacula::params::client_name,
  $client_package = $bacula::params::client_package,
  $client_conf = $bacula::params::client_conf,

) inherits bacula::params {

    include bacula::client::install
    include bacula::client::config
    include bacula::client::service

}
