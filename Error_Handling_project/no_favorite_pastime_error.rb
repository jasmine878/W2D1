class NoFavoritePasttimeError < StandardError
    def message
        "You need to enter a favorite pasttime."
    end
end