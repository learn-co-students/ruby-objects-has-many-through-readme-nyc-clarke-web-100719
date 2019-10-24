class Customer
  attr_accessor :name, :age

  @@all = []

def initialize(name, age)
    @name = name
    @age = age
    @@all << self
end

def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
end

def meals
    Meal.all.select { |meal| meal.customer == self } #what does this return
    #all the meals accociated with the customer
end

def waiters
    meals.map {|meal| meal.waiter}
end

def self.all
    @@all
end

end
