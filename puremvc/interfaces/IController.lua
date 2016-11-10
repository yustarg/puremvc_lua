local class = require 'middleclass.lua'

IController = class('IController')

function IController:RegisterCommand(notificationName, command)
	print("to implement in subclass")
end

function IController:ExecuteCommand(notification)
	print("to implement in subclass")
end

function IController:RemoveCommand(notificationName)
	print("to implement in subclass")
end

function IController:HasCommand(notificationName)
	print("to implement in subclass")
end

function IController:ListNotificationNames()
	print("to implement in subclass")
end