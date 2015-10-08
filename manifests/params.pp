# == Class:
class bacula::params {

  case $::osfamily {
    'Ubuntu','Debian': {

      #names
      $director_name = ${::hostname},


      #config files
      $conf_dir = '/etc/bacula'
      $director_conf = "${conf_dir}/bacula-dir.conf"
      $storage_conf = "${conf_dir}/bacula-sd.conf"
      $client_conf = "${conf_dir}/bacula-fd.conf"

      #packages
      $director_package = 'bacula-director-mysql'
      $storage_package = 'bacula-sd'
      $client_package =''

      #
    }
    default: {
      fail("Unsupported platform")
    }
  }
  # resources
}
