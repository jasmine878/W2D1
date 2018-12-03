class CoffeeError < StandardError
    #raising a CoffeeError.  Can't raise any method
    #need to inherit properties from StandardError class
    def message
        "You gave me coffee! You can retry."
    end
end