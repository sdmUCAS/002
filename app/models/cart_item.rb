class CartItem
    attr_reader  :instrument, :quantity
    
    def initialize(instrument)
        @instrument = instrument
        @quantity = 1
    end
    
    def increment_quantity
        @quantity +=1
    end
    
    def name
        @instrument.name
    end
    
    def price
        @instrument.price * @quantity
    end
    
end
