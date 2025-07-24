#!/usr/bin/env ruby
require "socket"

# 計測回数
repeats = 10
results = []
host = "localhost"
port = 65170
size = 100_000_000

repeats.times do |i|
  sock = TCPSocket.open(host, port)
  sock.puts "SpeedTest #{size}"

  # 応答待ち
  line = sock.gets&.chomp
  raise "Server error: #{line}" unless line == 'READY'

  # ダミーデータの受信
  received = 0
  while received < size
    data = sock.read([1_000_000, size - received].min)
    break unless data
    received += data.bytesize
  end

  # サーバからの経過時間を受け取り
  sock.gets
  dline = sock.gets&.chomp
  _, elapsed_str = dline.split
  elapsed = elapsed_str.to_i
  sock.close

  # スループットの計算
  mbps = (received.to_f * 8 / 1_000_000) / (elapsed / 1000.0)
  results << mbps
  puts "#{i+1}/#{repeats}: #{elapsed} ms → #{'%.3f' % mbps} Mbps"
end

# 平均値計算
avg = results.sum / results.size
puts "\n#{repeats}回の平均: #{'%.3f' % avg} Mbps"