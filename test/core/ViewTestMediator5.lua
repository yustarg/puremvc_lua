require "puremvc/patterns/Mediator/Mediator"
local class = require 'middleclass'

ViewTestMediator5 = class("ViewTestMediator5", Mediator)

ViewTestMediator5.static.NAME = "ViewTestMediator5"
		
function ViewTestMediator5:initialize(view) 
    Mediator.initialize(self, ViewTestMediator5.NAME, view)
end

function ViewTestMediator5:ListNotificationInterests()
    return { ViewTest.NOTE5 }
end

function ViewTestMediator5:HandleNotification(notification)
    self:GetViewComponent().counter = self:GetViewComponent().counter + 1
end