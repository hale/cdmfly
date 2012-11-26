require "cdmfly/version"
require 'optparse'

module Cdmfly

  puts "HERE BE ARGV:"
  ARGV.each { |a| puts a }
  puts


  puts "Usage: cdmfly <command> [<args>]"
  puts "Commands:"
  puts "\t" + "info"   + "\t" + "display information about this project"
  puts "\t" + "start"  + "\t" + "start cdmfly in this directory"
  puts "\t" + "new"    + "\t" + "creates a new project"
  puts "\t" + "launch" + "\t" + "open the project page in the default web browser"
  puts
  puts "For help with specific commands run: cdmfly <command> help"

#  #return a structure describing the options
  #def self.parse(args)
    #options = OpenStruct.new
    #options.library = []
    #options.encoding = 'utf8'
    #options.transfer_type = :auto
    #options.verbose = true

    #opts = OptionParser.new do |opts|
      #opts.banner = "Usage: cdmfly <command> [<args>]"

      #opts.separator ""
      #opts.separator "List of commands:"

    #end

    #opts.parse!(args)
    #options
  #end


  def self.root
    File.expand_path '../..', __FILE__
  end
end
