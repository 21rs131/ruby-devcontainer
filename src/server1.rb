#!/usr/bin/ruby

require "socket"
def server sock
  while buf = sock.gets
    p buf
  end
end

s0 = TCPServer.open(80)
sock = s0.accept
server sock
s0.close
