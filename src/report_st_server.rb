#!/usr/bin/env ruby
require "socket"

server = TCPServer.open(65170)

loop do
  client = server.accept
  Thread.new(client) do |sock|
    begin
      line = sock.gets&.chomp
      cmd, size_str = line&.split
      if cmd != 'SpeedTest' || size_str !~ /^\d+$/
        sock.puts 'ERROR Invalid command'
        sock.close
        next
      end

      size = size_str.to_i
      sock.puts 'READY'

      # 時間計測
      start_t = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      
      bytes_size = size
      chunk = "\0" * 1_000_000

      while bytes_size > 0
        send_size = [chunk.bytesize, bytes_size].min
        sock.write chunk[0, send_size]
        bytes_size -= send_size
      end

      elapsed_ms = ((Process.clock_gettime(Process::CLOCK_MONOTONIC) - start_t) * 1000).to_i
      
      sock.puts
      sock.puts "DONE #{elapsed_ms}"
    ensure
      sock.close
    end
  end
end

server.close