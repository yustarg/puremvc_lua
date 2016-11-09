local class = require 'middleclass.lua'

IModel = class('IModel')

function IModel:RegisterObserver(notificationName, observer)
	print("to implement in subclass")
end

function IModel:RemoveObserver(notificationName, notifyContext)
	print("to implement in subclass")
end

function IModel:NotifyObservers(notification)
	print("to implement in subclass")
end

function IModel:RegisterMediator(mediator)
	print("to implement in subclass")
end

function IModel:RetrieveMediator(mediatorName)
	print("to implement in subclass")
end

function IModel:RemoveMediator(mediatorName)
	print("to implement in subclass")
end

function IModel:HasMediator(mediatorName)
	print("to implement in subclass")
end

function IModel:ListMediatorNames()
	print("to implement in subclass")
end