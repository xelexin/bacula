# == Class: bacula::director
#
class bacula::director (
  $director_package = $bacula::params::director_package,
  $director_conf = $bacula::params::director_conf

) inherits bacula::params {

    notify($director_conf)
    include bacula::director::install
    include bacula::director::config
    include bacula::director::service

}
