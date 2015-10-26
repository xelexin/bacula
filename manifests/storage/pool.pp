define bacula::storage::pool (
  $pool_name,
  $pool_recycle = $bacula::params::pool_recycle,
  $pool_auto_prune = $bacula::params::pool_auto_prune,
  $pool_vol_retention = $bacula::params::pool_vol_retention,
  $pool_max_vol_bytes = $bacula::params::pool_max_vol_bytes,
  $pool_recycle_oldest_vol = $bacula::params::pool_recycle_oldest_vol,
  $pool_label_vol = $bacula::params::pool_label_vol,

  $storage_name = $bacula::params::storage_name,
  ) {
  @@concat::fragment{ "$pool_name-pool":
    target  => $bacula::params::director_conf,
    order   => '9',
    content => template('bacula/storage/pool.erb'),
    tag     => 'pools',
  }
}
