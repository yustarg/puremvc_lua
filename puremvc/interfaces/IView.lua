local class = require 'middleclass'

IView = class('IView')

function IView:RegisterObserver(notificationName, observer)
	print("to implement in subclass")
end

function IView:RemoveObserver(notificationName, notifyContext)
	print("to implement in subclass")
end

function IView:NotifyObservers(notification)
	print("to implement in subclass")
end

function IView:RegisterMediator(mediator)
	print("to implement in subclass")
end

function IView:RetrieveMediator(mediatorName)
	print("to implement in subclass")
end

function IView:RemoveMediator(mediatorName)
	print("to implement in subclass")
end

function IView:HasMediator(mediatorName)
	print("to implement in subclass")
end

function IView:ListMediatorNames()
	print("to implement in subclass")
end