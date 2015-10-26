# == Define: bacula::client::backup
#
define bacula::client::backup (
  $backup_files,
  $backup_run_options,
  $backup_pool,
  $backup_level = $bacula::params::backup_level,
  ) {
#    @@concat::fragment{"$::hostname-$backup_level-$backup_files-fs":
    @@concat::fragment{"asdgasdasdasfkamsdlafs":
      target  => '/etc/bacula/bacula-dir.conf',
      order   => '10',
      content => template('bacula/client/fileset.erb'),
      tag     => 'filesets',
    }



}
