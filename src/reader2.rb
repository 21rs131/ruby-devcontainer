path = ARGV[0]
File.open path,"r" do |f|

  cnt = 0
  while line = f.gets&.chomp
    #print cnt += 1 ,": ",line,"\n"
    puts "#{cnt += 1}:#{line}"
  end 
end