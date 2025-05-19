a=[10,20,50,30]

puts a.join(",")

a.each do |i|
  puts i
end

for i in 0..a.length do
  pp a[i]
end

#doなしでも動く
i=0
while i<a.length do
  pp a[i]
  i+=1
end
puts

if a[0]%2==0
  a.shift
end
a.each do |i| puts i end

puts a