#! /usr/bin/env ruby
#今時は上らしい
#昔は下の絶対パス
##! /usr/local/bin/ruby

path = ARGV
path.each do |arg|
  File.open arg,"r" do |f|

    cnt = 0
    while line = f.gets&.chomp
      #print cnt += 1 ,": ",line,"\n"
      puts "#{cnt += 1}:#{line}"
    end
  end
  puts
end
