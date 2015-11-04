# == Class: bacula::storage::config
#
class bacula::storage::config inherits bacula::storage {
  file {"$storage_work_dir":
    ensure => "directory",
      owner => 'bacula',
      group => 'bacula',
  }


  concat { $storage_conf:
    owner => 'bacula',
    group => 'bacula',
    mode => '0644',,
    ensure_newline => 'true',
  }

  concat::fragment { 'storage_conf_main':
    target  => $storage_conf,
    order   => '01',
    mode    => '0644',
    content => template('bacula/storage/bacula-sd.conf.erb')
  }

  Concat::Fragment <<| tag == "device_$storage_name" |>>

  @@concat::fragment { "dir_conf_fragment_$storage_name":
  	target => $director_conf,
  	order => '10',
  	content => template('bacula/storage/storage.erb'),
    tag => 'storage_part',
  }

}
