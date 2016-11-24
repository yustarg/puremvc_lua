local class = require 'middleclass'

MacroCommandTestVO = class("MacroCommandTestVO")

function MacroCommandTestVO:initialize(input)
    self.input = input
    self.result1 = 0
    self.result2 = 0
end  

function MacroCommandTestVO:GetInput()
    return self.input
end

function MacroCommandTestVO:GetResult1()
    return self.result
end

function MacroCommandTestVO:SetResult(result1)
    self.result1 = result1
end

function MacroCommandTestVO:GetResult2()
    return self.result2
end

function MacroCommandTestVO:SetResult(result2)
    self.result2 = result2
end