#! /usr/bin/env ruby

require "socket"

s = TCPSocket.open("www.is.kyusan-u.ac.jp", 80)
s.print("GET / HTTP/1.0\r\n")
s.print("\r\n")
while line=s.gets&.chomp
  pp line
end