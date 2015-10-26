# == Class: bacula::storage::pool
#
class bacula::storage::pool (
  $storage_name,
  $pool_name,
  $pool_recycle = $bacula::params::pool_recycle,
  $pool_auto_prune = $bacula::params::pool_auto_prune,
  $pool_vol_retention = $bacula::params::pool_vol_retention,
  $pool_max_vol_bytes = $bacula::params::pool_max_vol_bytes,
  $pool_recycle_oldest_vol = $bacula::params::pool_recycle_oldest_vol,
  $pool_label_vol = $bacula::params::pool_label_vol,

  ) inherits bacula::params {
  @@concat::fragment{ "$pool_name-pool":
    target  => $director_conf,
    order   => '10',
    content => template['bacula/director/pool.erb'],
    tag     => 'pools',
  }
}