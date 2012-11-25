step "I run :command" do |command|
  #Cocaine::CommandLine.path = "bin"
  line = Cocaine::CommandLine.new( command )
  line.run
end
