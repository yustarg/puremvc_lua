require "puremvc/patterns/Observer/Notifier"
local class = require 'middleclass'

Mediator = class('Mediator', Notifier) 

Mediator.static.NAME = "Mediator"

function Mediator:initialize(mediatorName, viewComponent)
	self.m_mediatorName = mediatorName
	self.viewComponent = viewComponent
end

function Mediator:GetMediatorName()
	return self.m_mediatorName
end

function Mediator:SetViewComponent(viewComponent)
	self.viewComponent = viewComponent
end

function Mediator:GetViewComponent()
	return self.viewComponent
end

function Mediator:HandleNotification(notification)
	
end

function Mediator:OnRegister()
	
end

function Mediator:OnRemove()
	
end

function Mediator:ListNotificationInterests()
	return {}
end