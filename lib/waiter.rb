class Waiter
    attr_reader :name, :yrsofexp
    @@all = []

    def initialize(name, yrsofexp)
        @name = name
        @yrsofexp = yrsofexp
        @@all << self
    end

    def self.all 
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select { |meal| meal.waiter == self}
    end
    
    def tips
        tip_arr = meals.map { |meal| meal.tip}
        tip_arr.sort!
    end

    def best_tipper
        best_tipped_meal = meals.find { |meal| meal.tip == tips[-1] }
        best_tipped_meal.customer
    end

end