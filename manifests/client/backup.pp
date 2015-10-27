# == Define: bacula::client::backup
#
define bacula::client::backup (
  $backup_files,
  $backup_run_options,
  $backup_pool,
  $backup_level = $bacula::params::backup_level,
  ) {

    $backup_fs_name = "${::hostname}-${backup_level}-${backup_files}-${backup_run_options}-fileset"

    @@concat::fragment{"$::hostname-$backup_level-$backup_files-fs":
      target  => $bacula::params::director_conf,
      order   => '10',
      content => template('bacula/client/fileset.erb'),
      tag     => 'filesets',
    }

    $backup_schedule_name = "${::hostname}-${backup_level}-${backup_files}-${backup_run_options}-schedule"

    @@concat::fragment{"$::hostname-$backup_level-$backup_files-schedule":
      target => $bacula::params::director_conf,
      order => '10',
      content => template('bacula/client/schedule.erb'),
      tag => 'schedules',
  }

}
