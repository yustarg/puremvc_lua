require "puremvc/patterns/Command/SimpleCommand"

local class = require 'middleclass'

MacroCommandTestSub2Command = class("MacroCommandTestSub2Command", SimpleCommand)

function MacroCommandTestSub2Command:initialize()
    SimpleCommand.initialize(self)
end

function MacroCommandTestSub2Command:Execute(note)
	local vo = note:GetBody()
	vo.result2 = vo.input * vo.input
end