require "puremvc/patterns/Mediator/Mediator"
local class = require 'middleclass'

ViewTestMediator = class("ViewTestMediator", Mediator)

ViewTestMediator.static.NAME = "ViewTestMediator"
		
function ViewTestMediator:initialize(name, view) 
    Mediator:initialize(ViewTestMediator.NAME .. name, view)
end

function ViewTestMediator:ListNotificationInterests()
    return {"ABC", "DEF", "GHI"}
end