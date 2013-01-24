require 'spec_helper'

describe 'cube', :type => :class do

  context 'no parameters' do
    it { should contain_package('cube').with_provider('npm').with_ensure('latest')}
    it { should create_class('cube::config')}
    it { should create_class('cube::install')}
    it { should create_class('cube::service')}
    it { should contain_file('/etc/init/cube-evaluator.conf')}
    it { should contain_file('/etc/init/cube-collector.conf')}
    it { should contain_service('cube-collector').with_ensure('running').with_enable('true') }
    it { should contain_service('cube-evaluator').with_ensure('running').with_enable('true') }

    context 'default collector config' do
      it { should contain_file('/usr/local/lib/node_modules/cube/bin/collector-config.js').with_content(/127\.0\.0\.1/)}
      it { should contain_file('/usr/local/lib/node_modules/cube/bin/collector-config.js').with_content(/1080/)}
      it { should contain_file('/usr/local/lib/node_modules/cube/bin/collector-config.js').with_content(/1180/)}
      it { should_not contain_file('/usr/local/lib/node_modules/cube/bin/collector-config.js').with_content(/mongo_username/)}
      it { should_not contain_file('/usr/local/lib/node_modules/cube/bin/collector-config.js').with_content(/mongo_password/)}
    end

    context 'default evaluator config' do
      it { should contain_file('/usr/local/lib/node_modules/cube/bin/evaluator-config.js').with_content(/127\.0\.0\.1/)}
      it { should contain_file('/usr/local/lib/node_modules/cube/bin/evaluator-config.js').with_content(/1081/)}
      it { should_not contain_file('/usr/local/lib/node_modules/cube/bin/evaluator-config.js').with_content(/mongo_username/)}
      it { should_not contain_file('/usr/local/lib/node_modules/cube/bin/evaluator-config.js').with_content(/mongo_password/)}
    end

    context 'passing a custom port for the collector' do
      let(:params) { {:collector_http_port => 8990} }
      it { should contain_file('/usr/local/lib/node_modules/cube/bin/collector-config.js').with_content(/8990/)}
    end
  end
end
