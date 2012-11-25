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

step "I should see some help text" do
  #File.open("#{Cdmfly.root}/spec/out.txt") do |f|
  File.open("spec/out.txt") do |f|
    #f.each {|line| puts "#{f.lineno}: #{line}" }
    f.each do |line|
        line.should eq("Help") 
    end
  end
end

