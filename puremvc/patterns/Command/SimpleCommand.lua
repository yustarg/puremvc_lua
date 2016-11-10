local class = require 'middleclass.lua'
local Notifier = require 'Patterns/Observer/Notifier.lua'

SimpleCommand = class('SimpleCommand', Notifier)

function SimpleCommand:initialize()

end

function SimpleCommand:Execute(notification)

end