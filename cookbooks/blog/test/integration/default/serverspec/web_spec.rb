require 'spec_helper'

describe 'blog::web' do
  describe package('nginx') do
      it { should be_installed }
  end

  describe service('nginx') do
    it { should be_running }
    it { should be_enabled }
  end

  describe file('/etc/nginx/sites-available/blog.com') do
    it { should exist }
  end

  describe port('80') do
    it { should be_listening }
  end

  describe file('/etc/nginx/sites-enabled/blog.com') do
    it { should be_symlink }
  end
end
