module StepHelper
  def self.fetch_output
    output = ""
    #File.open("#{Cdmfly.root}/spec/out.txt") do |f|
    File.open("spec/out.txt").each do |line|
      output << line + "\n"
    end
    return output
  end
end

step "I run :command" do |command|
  process = ChildProcess.build command
  #process.io.stdout = File.new( "#{Cdmfly.root}/spec/out.txt", 'w+' )
  process.io.stdout = File.new( "spec/out.txt", 'w+' )
  process.start
  begin
    process.poll_for_exit(10)
  rescue ChildProcess::TimeoutError
    process.stop # tries increasingly harsher methods to kill the process.
  end
end



step "I should see :info" do |info|
  StepHelper.fetch_output.should include(info) 
end

step "I should see the following information:" do |table|
  #parse the stdout
  output = []
  StepHelper.fetch_output.split('\n').each do |line|
    output << line
  end

  table.each do |row|
    output.join.should include(row.first)
    output.join.should include(row.last)
  end
end
