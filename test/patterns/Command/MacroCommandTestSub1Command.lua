require "puremvc/patterns/Command/SimpleCommand"

local class = require 'middleclass'

MacroCommandTestSub1Command = class("MacroCommandTestSub1Command", SimpleCommand)

function MacroCommandTestSub1Command:initialize()
    SimpleCommand.initialize(self)
end

function MacroCommandTestSub1Command:Execute(note)
	local vo = note:GetBody()
	vo.result1 = 2 * vo.input
end