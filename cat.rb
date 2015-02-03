class Cat
  attr_accessor :name
  attr_accessor :color
  attr_accessor :weight

  def initialize(attrs)
    attrs.each_pair { |k,v| send("#{k}=", v) }
  end

  def owner
    OWNERS.find { |p| p.cat_name == @name }
  end

  def meow
    if fat?
      puts "Give me a CHEEZBURGR, #{owner.name}!"
    else
      puts "Meow, #{owner.name}!"
    end
  end

  def fat?
    @weight > 25
  end
end

class Owner
  attr_accessor :name
  attr_accessor :cat_name

  def initialize(attrs)
    attrs.each_pair { |k,v| send("#{k}=", v) }
  end
end

OWNERS = []
OWNERS << Owner.new(name: 'John Doe',     cat_name: 'Felix')
OWNERS << Owner.new(name: 'Jon Arbuckle', cat_name: 'Garfield')

felix    = Cat.new(name: 'Felix',    color: 'black',  weight: 10)
garfield = Cat.new(name: 'Garfield', color: 'orange', weight: 50)

felix.meow
garfield.meow
