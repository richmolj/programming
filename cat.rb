class Cat
  attr_accessor :name
  attr_accessor :color
  attr_accessor :weight

  def initialize(attrs)
    attrs.each_pair { |k,v| send("#{k}=", v) }
  end

  def meow
    if fat?
      puts "CHEEZBURGR"
    else
      puts "Meow!"
    end
  end

  def fat?
    @weight > 25
  end
end

felix    = Cat.new(name: 'Felix',    color: 'black',  weight: 10)
garfield = Cat.new(name: 'Garfield', color: 'orange', weight: 50)

felix.meow
garfield.meow
