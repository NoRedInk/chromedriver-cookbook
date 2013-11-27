require_relative 'spec_helper'

describe 'chromedriver::default' do

  subject(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set[:chromedriver][:version] = '1.0.0'
      node.set[:chromedriver][:archive_name]  = 'chromedriver_1.0.0.zip'
      node.set[:chromedriver][:source_url]  = 'https://chromedriver.googlecode.com/files/chromedriver_1.0.0.zip'
      node.set[:chromedriver][:path] = '/usr/bin'
      node.set[:chromedriver][:owner] = 'root'
      node.set[:chromedriver][:group] = 'root'
      node.set[:chromedriver][:mode] = '755'
    end.converge 'chromedriver::default'
  end

  before { stub_command(/test/).and_return(true) }

  it { should create_remote_file '/usr/bin/chromedriver_1.0.0.zip' }

  it { chef_run.remote_file("#{chef_run.node[:chromedriver][:path]}/#{chef_run.node[:chromedriver][:archive_name]}").should notify('execute[unzip_chromedriver]').immediately }

end
