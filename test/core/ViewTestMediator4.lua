require "puremvc/patterns/Mediator/Mediator"
local class = require 'middleclass'

ViewTestMediator4 = class("ViewTestMediator", Mediator)

ViewTestMediator4.static.NAME = "ViewTestMediator4"
		
function ViewTestMediator4:initialize(name, view) 
    Mediator:initialize(ViewTestMediator4.NAME, view)
end

function ViewTestMediator4:OnRegister()
    self.viewComponent.onRegisterCalled = true
end

function ViewTestMediator4:OnRemove()
    self.viewComponent.onRemoveCalled = true
end