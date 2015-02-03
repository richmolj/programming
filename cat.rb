class Cat

  def initialize(name)
    @name = name
  end

  def meow
    puts "Meow! I am #{@name}!"
  end

end

felix    = Cat.new('Felix')
garfield = Cat.new('Garfield')

felix.meow
garfield.meow
