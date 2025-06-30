#! /usr/bin/env ruby

require "socket"

path = ARGV
#print(path)
host = path[0]
path = "/" + path[1] + "/"

s = TCPSocket.open(host, 80)
s.print("HEAD #{path} HTTP/1.1\r\n")
s.print("Host: #{host}\r\n")
s.print("\r\n")
while line=s.gets&.chomp
  pp line
end