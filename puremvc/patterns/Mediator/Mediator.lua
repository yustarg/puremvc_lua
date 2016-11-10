local class = require 'middleclass'

Mediator = class('Mediator', IMediator) 

Mediator.static.NAME = "Mediator"

function Mediator:initialize(mediatorName, viewComponent)
	IMediator:initialize(mediatorName or Mediator.NAME, viewComponent)
end

function Mediator:ListNotificationInterests()
	return {}
end

function Mediator:HandleNotification(notification)
	-- body
end

function Mediator:OnRegister()
	-- body
end

function Mediator:OnRemove()
	-- body
end