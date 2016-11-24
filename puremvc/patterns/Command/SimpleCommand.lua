local class = require 'middleclass'
require 'puremvc/patterns/Observer/Notifier'

SimpleCommand = class('SimpleCommand', Notifier)

function SimpleCommand:initialize()
    Notifier.initialize(self)
end

function SimpleCommand:Execute(notification)
    
end