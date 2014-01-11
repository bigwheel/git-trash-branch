require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

PROJECT_ROOT = File::expand_path('../../', __FILE__)
SUBJECT_COMMAND = "#{PROJECT_ROOT}/git-trash-branch"
TEMP_DIRECTORY_FOR_TEST = File::expand_path('../temp_dir', __FILE__)

describe 'git-trash-branch' do
  #before :all do
  #  `mkdir -p #{TEMP_DIRECTORY_FOR_TEST}`
  #end

  #it 'should return 1 if branch does\'nt exists' do
  it 'does\'nt success when a branch name is not given (only show help text)' do
    `mkdir -p #{TEMP_DIRECTORY_FOR_TEST}`
    Dir::chdir TEMP_DIRECTORY_FOR_TEST
    `git init`
    `echo 'test_text' > test_file`
    `git add test_file && git commit -m "first commit"`

    status, = systemu(SUBJECT_COMMAND)
    status.should_not be_success

    `rm -rf #{TEMP_DIRECTORY_FOR_TEST}`
  end
end
