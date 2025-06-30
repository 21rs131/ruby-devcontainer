#!/usr/bin/ruby

# 1. TCPのポート80で接続を待ち受け
# # 2. 接続が来たら、"Hello, World!"と送信
# 2. whileの繰り返しで行を読み込む
# 2.1 読み込んだ行をソケットに送り返す

require "socket"

s0 = TCPServer.open(80)

loop do
  sock = s0.accept
  Thread.new do
    line = sock.gets&.chomp
    if line.nil? || line.empty?
      sock.close
      next
    end
    _cmd,path,_ver = line.split

    #print path
    case path
    when "/hello"
      sock.puts "HTTP/1.0 200 OK"
      sock.puts
      sock.puts "Hello, World!"
    when "/93"
      sock.puts "HTTP/1.0 301 Moved Permanently"
      sock.puts "Location: http://www.kyusan-u.ac.jp"
      sock.puts
    else
      path = path.gsub("/", "")
      #path = "./#{path}"
      if File.exist?(path)
        sock.puts "HTTP/1.0 200 OK"
        sock.puts "Content-Type: text/plain; charset=UTF-8"
        sock.puts
        
        pp path
        File.open path,"r" do |f|
          cnt = 0
          while line_file = f.gets&.chomp
            #print cnt += 1 ,": ",line,"\n"
            sock.puts "#{cnt += 1}:#{line_file}"
          end 
        end
      else
        sock.puts "HTTP/1.0 404 Not Found"
        sock.puts
        #sock.puts "File not found: #{path}"
      end
      #sock.puts path
    end
    sock.close
  end
end


#_,path,_ = line.split　これでもよし
# break if line == "\r\n"
# sock.gets&.chomp をつかうなら
# break if line == ""
# break if line.empty?
# ただし改行はなくなる
# ので sock.puts line か sock.print line+"\r\n"

s0.close