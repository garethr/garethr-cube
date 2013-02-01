class cube::install {
  package { 'cube':
    ensure   => present,
    source   => $cube::cube_source,
    provider => npm,
  }
}
