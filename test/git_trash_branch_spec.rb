require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

PROJECT_ROOT = File::expand_path('../../', __FILE__)
SUBJECT_COMMAND = "#{PROJECT_ROOT}/git-trash-branch"
TEMP_DIRECTORY_FOR_TEST = File::expand_path('../temp_dir', __FILE__)

describe 'git-trash-branch' do
  SRC_BRANCH_NAME = 'src_branch'
  DST_BRANCH_NAME = 'trash/src_branch'

  before :all do
    `mkdir -p #{TEMP_DIRECTORY_FOR_TEST}`
    BEFORE_PWD = Dir::pwd
    Dir::chdir TEMP_DIRECTORY_FOR_TEST
    `git init`
    `echo 'test_text' > test_file`
    `git add test_file && git commit -m "first commit"`
    Dir::chdir BEFORE_PWD
  end

  after :all do
    `rm -rf #{TEMP_DIRECTORY_FOR_TEST}`
  end

  it 'does\'nt success when a branch name was not given' do
    status, = systemu(SUBJECT_COMMAND)
    status.should_not be_success
  end

  it 'success when -h option was given' do
    status, = systemu("#{SUBJECT_COMMAND} -h")
    status.should be_success
  end

  it 'does\'nt success when a branch name didn\'t exist' do
    status, = systemu("#{SUBJECT_COMMAND} #{SRC_BRANCH_NAME}")
    status.should_not be_success
  end

  it 'success when a existing branch name was given' do
    `git checkout #{SRC_BRANCH_NAME}`
    status, = systemu("#{SUBJECT_COMMAND} #{SRC_BRANCH_NAME}")
    status.should be_success
  end

  it 'does\'nt success when current brach was specified as to trash' do
    `git checkout -b #{SRC_BRANCH_NAME}`
    status, = systemu("#{SUBJECT_COMMAND} #{SRC_BRANCH_NAME}")
    status.should_not be_success
  end
end
