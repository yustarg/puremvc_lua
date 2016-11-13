local class = require 'middleclass'

ControllerTestVO = class("ControllerTestVO")

function ControllerTestVO:initialize(input)
    self.input = input
    self.result = 0
end  

function ControllerTestVO:GetInput()
    return self.input
end

function ControllerTestVO:GetResult()
    return self.result
end

function ControllerTestVO:SetResult(result)
    self.result = result
end