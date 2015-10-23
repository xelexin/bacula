# == Class: bacula::director
#
class bacula::director (
  $director_name,
  $director_password,
  $bacula_db_password,
  $root_db_password,
  $director_logtofile = $bacula::params::director_logtofile,
  $director_address = $bacula::params::director_address,
  $director_port = $bacula::params::director_port,
  $director_work_dir = $bacula::params::director_work_dir,
  $director_pid_dir = $bacula::params::director_pid_dir,
  $director_max_jobs = $bacula::params::director_max_jobs,

  $director_package = $bacula::params::director_package,
  $director_conf = $bacula::params::director_conf,

) inherits bacula::params {

    include bacula::director::install
    include bacula::director::config
    include bacula::director::service


}
