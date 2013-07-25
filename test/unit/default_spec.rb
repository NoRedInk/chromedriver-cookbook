require_relative 'spec_helper'

describe 'chromedriver::default' do

  def init_chef_run
    chef_run = ChefSpec::ChefRunner.new
    chef_run.node.set[:chromedriver][:version] = '1.0.0'
    chef_run.node.set[:chromedriver][:archive_name]  = 'chromedriver_1.0.0.zip'
    chef_run.node.set[:chromedriver][:source_url]  = 'https://chromedriver.googlecode.com/files/chromedriver_1.0.0.zip'
    chef_run.node.set[:chromedriver][:path] = '/usr/bin'
    chef_run.node.set[:chromedriver][:owner] = 'root'
    chef_run.node.set[:chromedriver][:group] = 'root'
    chef_run.node.set[:chromedriver][:mode] = '755'
    chef_run.converge 'chromedriver::default'
    chef_run
  end

  it 'uses remote_file to download the chromedriver zip' do
    chef_run = init_chef_run
    expect(chef_run).to create_remote_file '/usr/bin/chromedriver_1.0.0.zip'
  end

  it 'will execute unzip command if file exists' do
    chef_run = init_chef_run
    expect(chef_run).to execute_command('unzip -j -o /usr/bin/chromedriver_1.0.0.zip chromedriver -d /usr/bin')
  end
end
