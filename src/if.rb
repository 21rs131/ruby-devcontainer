
=begin
puts "Hello"

#a=gets.to_i
s=gets.chomp
t=gets.chomp
#puts a+2
puts s+"2"
puts s+t

# Pretty Print
#pp a
pp s+t


print "a? "
a=gets.to_i
if a > 0
  puts "Positive"
elsif a == 0
  puts "Zero"
else 
  puts "Negative"
  puts "mainasus"
end
=end

print "name? "
name = gets.chomp
if name != "KSU"
  puts "大当たり"
else
  puts "???"
end

q=5
if q==3
  puts "Three"
end

puts  "three " if q==3
puts  "Not three " if q!=3
puts  "Not three " unless q==3


