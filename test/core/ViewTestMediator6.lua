require "puremvc/patterns/Mediator/Mediator"
local class = require 'middleclass'

ViewTestMediator6 = class("ViewTestMediator6", Mediator)

ViewTestMediator6.static.NAME = "ViewTestMediator6"
		
function ViewTestMediator6:initialize(name, view) 
    Mediator:initialize(name, view)
end

function ViewTestMediator6:ListNotificationInterests()
    return { ViewTest.NOTE6 }
end

function ViewTestMediator6:HandleNotification(notification)
    Facade:RemoveMediator(Mediator:GetMediatorName())
end

function ViewTestMediator6:OnRemove()
	Mediator:GetViewComponent().counter = Mediator:GetViewComponent().counter + 1
end