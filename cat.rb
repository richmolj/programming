class Cat
  attr_accessor :name
  attr_accessor :color
  attr_accessor :weight

  def initialize(attrs)
    attrs.each_pair { |k,v| send("#{k}=", v) }
  end

  def meow
    puts "Meow! I am #{@name}!"
  end

end

felix    = Cat.new('Felix')
garfield = Cat.new('Garfield')

felix.meow
garfield.meow
