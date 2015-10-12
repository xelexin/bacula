# == Class:
class bacula::params {

  case $::osfamily {
    'Ubuntu','Debian': {

      #config files
      $conf_dir = '/etc/bacula'
      $director_conf = "${conf_dir}/bacula-dir.conf"
      $storage_conf = "${conf_dir}/bacula-sd.conf"
      $client_conf = "${conf_dir}/bacula-fd.conf"

      #packages
      $director_package = 'bacula-director-mysql'
      $storage_package = 'bacula-sd'
      $client_package ='bacula-fd'

      $director_port = 9101
      $client_port = 9102


      #director params
      $director_name = "$::hostname-dir"
      $director_address = "$::ipaddress"
      $director_work_dir = "/usr/local/bacula/var/bacula/working"
      $director_pid_dir = '/var/run'
      $director_max_jobs = '5'
      $director_messages_name = 'DirMessaages'
      $director_logtofile = 'false'

      #client params
      $client_name = "$::hostname-fd"
      $client_address = "$::ipaddress"
      $client_work_dir = "/usr/local/bacula/var/bacula/working"
      $client_pid_dir = '/var/run'
      $client_max_jobs = '5'

    }
    default: {
      fail("Unsupported platform")
    }
  }
  # resources
}
