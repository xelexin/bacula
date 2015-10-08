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
      $client_package =''

      $director_port = 9101


      #director params
      $director_name = $::hostname
      $director_address = 'localhost'
      $director_work_dir = "/usr/local/bacula/var/bacula/working"
      $director_pid_dir = '/var/run'
      $director_max_jobs = '5'
      $director_messages_name = 'DirMessaages'
      $director_logtofile = 'false'

    }
    default: {
      fail("Unsupported platform")
    }
  }
  # resources
}
