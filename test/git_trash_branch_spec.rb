require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

TEMP_DIRECTORY_FOR_TEST = File::expand_path('../temp_dir', __FILE__)

describe 'git-trash-branch' do
  #before :all do
  #  `mkdir -p #{TEMP_DIRECTORY_FOR_TEST}`
  #end

  it 'should return 1 if branch does\'nt exists' do
    `mkdir -p #{TEMP_DIRECTORY_FOR_TEST}`
    Dir::chdir TEMP_DIRECTORY_FOR_TEST
    `git init`
    `echo 'test_text' > test_file`
    `git add test && git commit -m "first commit"`
    binding.pry
    `rm -rf #{TEMP_DIRECTORY_FOR_TEST}`
  end
end
