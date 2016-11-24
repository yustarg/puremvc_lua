local class = require 'middleclass'

FacadeTestVO = class("FacadeTestVO")

function FacadeTestVO:initialize(input)
    self.input = input
    self.result = 0
end  