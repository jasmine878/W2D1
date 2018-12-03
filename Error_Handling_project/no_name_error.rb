class NoNameError < StandardError
    def message
        "You need a name to have a best friend."
    end
end