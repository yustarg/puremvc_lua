local class = require 'middleclass.lua'
local Notifier = require 'Patterns/Observer/Notifier.lua'

MacroCommand = class('MacroCommand', Notifier)

function MacroCommand:initialize()
	self.m_subCommands = {}
    self:InitializeMacroCommand()
end

function MacroCommand:InitializeMacroCommand()
	-- body
end

function MacroCommand:Execute(notification)
	while(#self.m_subCommands > 0) do
        local ref = table.remove(self.m_subCommands, 1)
        local cmd = ref:new()
        cmd:InitializeNotifier(self.m_multitonKey)
        cmd:Execute(notification)
    end
end

function MacroCommand:AddSubCommand(command)
	table.insert(self.m_subCommands, command)
end