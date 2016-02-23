require 'spec_helper'

describe 'blog::default' do
  describe package('nginx') do
      it { should be_installed }
  end

  describe service('nginx') do
    it { should be_running }
    it { should be_enabled }
  end

end
