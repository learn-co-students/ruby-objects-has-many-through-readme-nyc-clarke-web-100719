class Meal
   attr_accessor :waiter, :customer, :total, :tip

   @@all =[]
    def initialize(waiter,customer, total, tip=0)
        @customer = customer
        @waiter = waiter
        @total = total
        @tip = tip
        @@all << self
    end

    def self.all
        @@all
    end
    
end