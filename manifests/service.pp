class cube::service {
  service { 'cube-collector':
    ensure     => 'running',
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    provider   => upstart,
  }
  service { 'cube-evaluator':
    ensure     => 'running',
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    provider   => upstart,
  }
}

