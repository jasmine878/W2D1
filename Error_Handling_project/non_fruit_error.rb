class NonFruitError < StandardError
    def message
        "You gave me a nonfruit! Nice try!"
    end
end