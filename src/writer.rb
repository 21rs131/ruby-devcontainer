file = File.open "sample.txt","w"

file.print("Hello")
file.write("書き込み")
$stdout.puts("ruby")
file.puts("ruby")

file.close

