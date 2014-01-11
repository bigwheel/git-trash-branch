require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

TEMP_DIRECTORY_FOR_TEST = File::expand_path('temp_dir', __FILE__)

describe 'git-trash-branch' do
  it 'should return 1 if branch does\'nt exists' do
    binding.pry
  end
end
