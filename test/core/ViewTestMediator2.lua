require "puremvc/patterns/Mediator/Mediator"
local class = require 'middleclass'

ViewTestMediator2 = class("ViewTestMediator2", Mediator)

ViewTestMediator2.static.NAME = "ViewTestMediator2"
		
function ViewTestMediator2:initialize(view) 
    Mediator:initialize(ViewTestMediator2.NAME, view)
end

function ViewTestMediator2:ListNotificationInterests()
    return { ViewTest.NOTE1, ViewTest.NOTE2 }
end

function ViewTestMediator2:HandleNotification(notification)
    print("ViewTestMediator2:HandleNotification " .. notification:GetName())
    Mediator:HandleNotification(notification)
    Mediator:GetViewComponent().lastNotification = notification:GetName()
end