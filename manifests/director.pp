# == Class: bacula::director
#
class bacula::director (
  $director_package = $bacula::params::director_package

) inherits bacula::params {


    include bacula::director::install
    include bacula::director::config
    include bacula::director::service

}
