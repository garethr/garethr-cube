class cube(
  $cube_source = $cube::params::cube_source,
  $collector_http_port = $cube::params::collector_http_port,
  $collector_udp_port = $cube::params::collector_udp_port,
  $evaluator_port = $cube::params::evaluator_port,
  $mongo_host = $cube::params::mongo_host,
  $mongo_port = $cube::params::mongo_port,
  $mongo_database = $cube::params::mongo_database,
  $mongo_username = $cube::params::mongo_username,
  $mongo_password = $cube::params::mongo_password
) inherits cube::params {

  require 'nodejs'

  class{'cube::install': } ->
  class{'cube::config': } ~>
  class{'cube::service': } ->
  Class['cube']
}
