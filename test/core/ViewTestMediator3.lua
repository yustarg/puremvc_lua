require "puremvc/patterns/Mediator/Mediator"
local class = require 'middleclass'

ViewTestMediator3 = class("ViewTestMediator3", Mediator)

ViewTestMediator3.static.NAME = "ViewTestMediator3"
		
function ViewTestMediator3:initialize(view) 
    Mediator.initialize(self, ViewTestMediator3.NAME, view)
end

function ViewTestMediator3:ListNotificationInterests()
    return { ViewTest.NOTE3 }
end

function ViewTestMediator3:HandleNotification(notification)
    self:GetViewComponent().lastNotification = notification:GetName()
end