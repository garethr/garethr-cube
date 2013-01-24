class cube::install {
  package { 'cube':
    ensure   => 'latest',
    provider => npm,
  }
}
