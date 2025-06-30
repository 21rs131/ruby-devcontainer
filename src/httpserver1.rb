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
    while line = sock.gets
      print line
      sock.print line
      if line == "\r\n"
        break
      end
    end
    sock.close
    sleep 60
  end
end

# break if line == "\r\n"
# sock.gets&.chomp をつかうなら
# break if line == ""
# break if line.empty?
# ただし改行はなくなる
# ので sock.puts line か sock.print line+"\r\n"

s0.close