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
      $client_package ='bacula-client'

      $director_port = 9101
      $client_port = 9102
      $storage_port = 9103

      #director params
      $director_name = "$::hostname-dir"
      $director_address = "$::ipaddress"
      $director_work_dir = '/var/lib/bacula/working'
      $director_pid_dir = '/var/run/bacula'
      $director_max_jobs = '5'
      $director_messages_name = 'DirMessages'
      $director_logtofile = 'true'

      #storage params
      $storage_name = "$::hostname-sd"
      $storage_password = "$::generate_password"
      $storage_address = "$::ipaddress"
      $storage_work_dir = '/var/lib/bacula/working'
      $storage_pid_dir = '/var/run/bacula'

      #client params
      $client_name = "$::hostname-fd"
      $client_password = "$::generate_password"
      $client_address = "$::ipaddress"
      $client_work_dir = '/var/lib/bacula/working'
      $client_pid_dir = '/var/run/bacula'
      $client_max_jobs = '5'

      #device params
      $device_removable = "no"
      $device_random_access = "yes"
      $device_mount = "no"
      $device_type = "File"
      $device_media_type = "File"

      #pool params
      $pool_recycle = "yes"
      $pool_auto_prune = "yes"
      $pool_vol_retention = "7 day"
      $pool_max_vol_bytes = "512MB"
      $pool_recycle_oldest_vol = "yes"
      $pool_label_vol = "Vol-$::hostname-"

      #backup params
      $backup_level = "Full"
    }
    default: {
      fail("Unsupported platform")
    }
  }
  # resources
}
