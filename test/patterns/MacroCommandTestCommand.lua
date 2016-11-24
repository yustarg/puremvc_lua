require "puremvc/patterns/Command/MacroCommand"
require "test/patterns/MacroCommandTestSub1Command"
require "test/patterns/MacroCommandTestSub2Command"

local class = require 'middleclass'

MacroCommandTestCommand = class("MacroCommandTestCommand", MacroCommand)

function MacroCommandTestCommand:initialize()
    MacroCommand.initialize(self)
end

function MacroCommandTestCommand:InitializeMacroCommand()
	MacroCommand.InitializeMacroCommand(self)
	self:AddSubCommand(MacroCommandTestSub1Command:new())
	self:AddSubCommand(MacroCommandTestSub2Command:new())
end