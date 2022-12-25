class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end

# write an add_item(title, price) method that accepts two parameters
    def add_item(title, amount, quantity = 1)
        # when an addition is run it needs to assign the value of the amount to the last_transaction instance variable so it can referenced later if wanted
        self.last_transaction = amount * quantity
        self.total += self.last_transaction
        quantity.times do
            self.items << title
        end
        # @total += price * quantity 
        # ^^^THIS IS THE WORKING ADD ITEM CALCULATION FIRST ITERATION but this is not an instance method inside a method as the lab wants
    end
#     # write apply_discount method





    def apply_discount
        if self.discount != 0
            # create a variable that will be the discount percentage amount passed in
            discount_as_a_percentage = (100.0 - self.discount.to_f) / 100
            self.total = (self.total * discount_as_a_percentage).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end


    def void_last_transaction
        self.total -= self.last_transaction
    end

end