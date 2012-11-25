require "cdmfly/version"

module Cdmfly
  # Your code goes here...
  puts 'this is the cdmfly module'

  def self.root
    File.expand_path '../..', __FILE__
  end
end
