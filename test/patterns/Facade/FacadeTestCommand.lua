require "puremvc/patterns/Command/SimpleCommand"

local class = require 'middleclass'

FacadeTestCommand = class("FacadeTestCommand", SimpleCommand)

function FacadeTestCommand:initialize()
    SimpleCommand.initialize(self)
end

function FacadeTestCommand:Execute(note)
	SimpleCommand.Execute(self)
  	local vo = note:GetBody()
 	vo.result = 2 * vo.input
end