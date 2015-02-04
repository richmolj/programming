require 'active_record'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define do
  create_table :cats do |t|
    t.integer :owner_id
    t.string :name
    t.string :color
    t.integer :weight
  end

  create_table :owners do |t|
    t.string :name
  end
end

class Cat < ActiveRecord::Base
  belongs_to :owner

  def meow
    if fat?
      puts "Give me a CHEEZBURGR, #{owner.name}!"
    else
      puts "Meow, #{owner.name}!"
    end
  end

  def fat?
    weight > 25
  end
end

class Owner < ActiveRecord::Base
  has_one :cat
end

# Persist Data
john = Owner.create(name: 'John Doe')
jon  = Owner.create(name: 'Jon Arbuckle')
Cat.create(name: 'Felix',    color: 'black',  weight: 10, owner: john)
Cat.create(name: 'Garfield', color: 'orange', weight: 50, owner: jon)

# Load data
felix    = Cat.find(1)
garfield = Cat.find(2)

# Take action
felix.meow
garfield.meow

# Update data
garfield.update_attribute(:weight, 15)

# See change
garfield.meow
