class Parson
  attr_writer age
  def initialize name , age
    @name = name
    @age = age
  end

  def info
    @name + "," + @age.to_s
  end

  def set_age x
    @age = x
  end
end

p = Parson.new "taro", 5
puts p.info

p.set 0
puts p.info