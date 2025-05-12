File.open "sample.txt","a" do |f|
  f.puts("Hello")
  f.puts("書き込み")
  f.puts("ruby")
end

File.open "sample.txt","r" do |f|
  pp f.read
end
