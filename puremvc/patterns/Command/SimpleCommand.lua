local class = require 'middleclass'
require 'puremvc/patterns/Observer/Notifier'

SimpleCommand = class('SimpleCommand', Notifier)

function SimpleCommand:initialize()

end

function SimpleCommand:Execute(notification)

end