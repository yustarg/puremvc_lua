require 'puremvc/patterns/Observer/Notifier'
local class = require 'middleclass'

MacroCommand = class('MacroCommand', Notifier)

function MacroCommand:initialize()
    Notifier.initialize(self)
    self.m_subCommands = {}
    self:InitializeMacroCommand()
end

function MacroCommand:InitializeMacroCommand()
	-- body
end

function MacroCommand:Execute(notification)
	while(#self.m_subCommands > 0) do
        local cmd = table.remove(self.m_subCommands, 1)
        --local cmd = ref:new()
        cmd:InitializeNotifier(self.m_multitonKey)
        cmd:Execute(notification)
    end
end

function MacroCommand:AddSubCommand(command)
	table.insert(self.m_subCommands, command)
end