def max x,y
  if x>y
    x
  else
    y
  end
  x+y
end

def evenOdd x
  if x%2 == 0
    "even"
  else
    "odd"
  end
end


x=5
y=10
z=max(x,y)
puts z

a=evenOdd(5)
puts a
puts evenOdd 100