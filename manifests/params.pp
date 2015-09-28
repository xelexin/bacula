# == Class:
class bacula::params {

  case $::osfamily {
    'Ubuntu': {

      #config files
      $conf_dir = '/etc/bacula',
      $director_conf = '${conf_dir}/bacula-dir.conf',
      $storage_conf = '${conf_dir}/bacula-sd.conf',
      $client_conf = '${conf_dir}/bacula-fd.conf',


    }
    default: {
      fail:("Unsupported platform"),
    }
  }
  # resources
}
