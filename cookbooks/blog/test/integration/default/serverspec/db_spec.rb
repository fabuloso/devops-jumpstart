require 'spec_helper'

describe 'blog::db' do

  describe package('mysql-server-5.6') do
    it { should be_installed }
  end

  describe service('mysql') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port('3306') do
    it { should be_listening}
  end

end
