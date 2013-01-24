class cube::config {
  $collector_http_port = $cube::collector_http_port
  $collector_udp_port = $cube::collector_udp_port
  $evaluator_port = $cube::evaluator_port
  $mongo_host = $cube::mongo_host
  $mongo_port = $cube::mongo_port
  $mongo_database = $cube::mongo_database
  $mongo_username = $cube::mongo_username
  $mongo_password = $cube::mongo_password
  file { '/etc/init/cube-evaluator.conf':
    ensure => present,
    source => 'puppet:///modules/cube/etc/init/cube-evaluator.conf',
  }
  file { '/etc/init/cube-collector.conf':
    ensure => present,
    source => 'puppet:///modules/cube/etc/init/cube-collector.conf',
  }
  file { '/usr/local/lib/node_modules/cube/bin/evaluator-config.js':
    ensure  => present,
    content => template('cube/usr/local/lib/node_modules/cube/bin/evaluator-config.js.erb')
  }
  file { '/usr/local/lib/node_modules/cube/bin/collector-config.js':
    ensure  => present,
    content => template('cube/usr/local/lib/node_modules/cube/bin/collector-config.js.erb')
  }
}
