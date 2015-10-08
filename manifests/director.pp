# == Class: bacula::director
#
class bacula::director (
  $director_password,

  $director_name = $bacula::params::director_name,
  $director_package = $bacula::params::director_package,
  $director_conf = $bacula::params::director_conf

) inherits bacula::params {

    include bacula::director::install
    include bacula::director::config
    include bacula::director::service

}
