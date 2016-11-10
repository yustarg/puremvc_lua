local class = require 'middleclass.lua'

IMediator = class('IMediator')

function IMediator:initialize(mediatorName, viewComponent)
	self.m_mediatorName = mediatorName
	self.viewComponent = viewComponent
end

function IMediator:GetMediatorName()
	return self.m_mediatorName
end

function IMediator:SetViewComponent(viewComponent)
	self.viewComponent = viewComponent
end

function IMediator:GetViewComponent()
	return self.viewComponent
end

function IMediator:HandleNotification(notification)
	print("to implement in subclass")
end

function IMediator:OnRegister()
	print("to implement in subclass")
end

function IMediator:OnRemove()
	print("to implement in subclass")
end

function IMediator:ListNotificationInterests()
	print("to implement in subclass")
end