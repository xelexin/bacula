# == Define: bacula::client::backup
#
define bacula::client::backup (
  $backup_files,
  $backup_run_options,
  $backup_pool,
  $backup_level = $bacula::params::backup_level,
  ) {
    $client_name = $bacula::params::client_name

    $backup_fs_name_temp = "${::hostname}-${backup_level}-${backup_files}-${backup_run_options}-fileset"
    $backup_fs_name = regsubst($backup_fs_name_temp,'/','_','G')

    @@concat::fragment{"$::hostname-$backup_level-$backup_files-$backup_run_options-fs":
      target  => $bacula::params::director_conf,
      order   => '10',
      content => template('bacula/client/fileset.erb'),
      tag     => 'filesets',
    }

    $backup_schedule_name_temp = "${::hostname}-${backup_level}-${backup_files}-${backup_run_options}-schedule"
    $backup_schedule_name = regsubst($backup_schedule_name_temp,'/','_','G')
    @@concat::fragment{"$::hostname-$backup_level-$backup_files-$backup_run_options-schedule":
      target => $bacula::params::director_conf,
      order => '10',
      content => template('bacula/client/schedule.erb'),
      tag => 'schedules',
  }
    $backup_job_name_temp = "${::hostname}-${backup_level}-${backup_files}-${backup_run_options}-job"
    $backup_job_name = regsubst($backup_job_name_temp,'/','_','G')
    @@concat::fragment{"$::hostname-$backup_level-$backup_files-$backup_run_options-job":
      target => $bacula::params::director_conf,
      order => '10',
      content => template('bacula/client/job.erb'),
      tag => 'jobs',
  }
}
