# == Class: bacula::device
#
class bacula::device {
  if !defined(Class["bacula::storage"])
    { fail('Device can by only run on storage host') }



}
