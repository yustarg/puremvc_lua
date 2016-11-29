require "puremvc/patterns/Command/SimpleCommand"

local class = require 'middleclass'

SimpleCommandTestCommand = class("SimpleCommandTestCommand", SimpleCommand)

function SimpleCommandTestCommand:initialize()
    SimpleCommand.initialize(self)
end

function SimpleCommandTestCommand:Execute(note)
	SimpleCommand.Execute(self)
  	local vo = note:GetBody()
  	vo.result = 2 * vo.input
end