class cube::install {
  package { 'cube':
    ensure   => $cube::cube_source ? {
      'cube' => 'latest',
      default => 'present'
    },
    source   => $cube::cube_source,
    provider => npm,
  }
}
