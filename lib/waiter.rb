class Waiter
    attr_accessor :name, :yrs_experience

    @@all = []
    
    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        self.class.all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def new_meal_20_percent(waiter, total)
        tip = total * 0.2
        Meal.new(waiter, self, total, tip)
      end    

    def meals
        Meal.all.select { |meal| meal.waiter == self }
    end

    def customers
        meals.map { |meal| meal.customer }
    end 

    def tips
        meals.map { |meal| meal.tip }
    end

    def avg_tips
        tips.inject(&:+).to_f / tips.size

    end

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
          meal_a.tip <=> meal_b.tip
        end
       
        best_tipped_meal.customer
    end
      
    def most_frequent_customer
        customers.max_by { |customer| customers.count(customer) }
    end

    def worst_tipped_meal
        meals.min_by { |meal| meal.tip }
    end

    def self.avg_tips_most_yrs
        most_xp = self.all.max_by { |waiter| waiter.yrs_experience }
        most_xp.avg_tips
    end

    def self.avg_tips_least_yrs
        least_xp = self.all.min_by { |waiter| waiter.yrs_experience }
        least_xp.avg_tips
    end

    def self.oldest_customer
        oldest_age = 0
        oldest_customer = nil
        self.all.each do |customer|
          if customer.age > oldest_age
            oldest_age = customer.age
            oldest_customer = customer
          end
        end
        oldest_customer
      end
    
end