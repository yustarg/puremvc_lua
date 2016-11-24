local class = require 'middleclass'

SimpleCommandTestVO = class("MacroCommandTestVO")

function SimpleCommandTestVO:initialize(input)
    self.input = input
    self.result = 0
end  