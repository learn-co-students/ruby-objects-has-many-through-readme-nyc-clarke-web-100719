class Waiter

attr_accessor :name, :experiance

@@all = []
    def initialize(name, experiance)
        @name = name
        @experiance = experiance
        @@all << self
    end

    def self.all
        @@all 
    end

    def new_meal(customer,total,tip)
        Meal.new(self,customer,total,tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        larg_tip = 0
        small_tip = 0
        answer= ""
         meals.select do |meal|
            larg_tip = meal.tip
            if larg_tip > small_tip
              small_tip = larg_tip
            answer=  meal.customer
            end
           
        end
        answer
    end
end