File.open "reader.rb","r" do |f|

  cnt = 0
  while line = f.gets&.chomp
    #print cnt += 1 ,": ",line,"\n"
    puts "#{cnt += 1}:#{line}"
  end 
end