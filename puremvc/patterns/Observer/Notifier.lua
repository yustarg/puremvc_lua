local class = require 'middleclass.lua'
local Facade = require 'Patterns/Facade/Facade.lua'

Notifier = class('Notifier')

Notifier.static.MULTITON_MSG = "multitonKey for this Notifier not yet initialized!";

function Notifier:initialize()
	
end

function Notifier:InitializeNotifier(key)
	self.m_multitonKey = key
end

function Notifier:SendNotification(notificationName, body, type)
	local facade = self:GetFacade()
	facade:SendNotification(notificationName, body, type)
end

function Notifier:GetFacade()
	if self.m_multitonKey == nil then
		error(Notifier.MULTITON_MSG)
	end
	return Facade.GetInstance(self.m_multitonKey)
end