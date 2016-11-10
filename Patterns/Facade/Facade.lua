local IFacade = require 'Interfaces/IFacade.lua'
local Controller = require 'Core/Controller.lua'
local Model = require 'Core/Model.lua'
local View = require 'Core/View.lua'
local class = require 'middleclass.lua'

Facade = class('Facade', IFacade) 

Facade.static.m_instanceMap = {}
Facade.static.MULTITON_MSG = "Facade instance for this Multiton key already constructed!"

function Facade:initialize(key)
	if Facade.m_instanceMap[key] ~= nil then
		error(Facade.MULTITON_MSG)
	end
    self:InitializeNotifier(key)
	Facade.m_instanceMap[key] = self
	self:InitializeFacade()
end

function Facade:InitializeNotifier(key)
	self.m_multitonKey = key
end

function Facade:InitializeFacade()
	self:InitializeModel()
    self:InitializeController()
    self:InitializeView()
end

function Facade:InitializeModel()
	if self.m_model ~= nil then return end
    self.m_model = Model.GetInstance(self.m_multitonKey)
end

function Facade:InitializeController()
	if self.m_controller ~= nil then return end
    self.m_controller = Controller.GetInstance(self.m_multitonKey)
end

function Facade:InitializeView()
	if self.m_model ~= nil then return end
    self.m_model = View.GetInstance(self.m_multitonKey)
end

function Facade.GetInstance(key)
	if Facade.m_instanceMap[key] ~= nil then
		return Facade.m_instanceMap[key]
	end
	Facade.m_instanceMap[key] = Facade:new(key)
	return Facade.m_instanceMap[key]
end

function Facade:RegisterProxy(proxy)
	self.m_model:RegisterProxy(proxy)
end

function Facade:RetrieveProxy(proxyName)
	return self.m_model:RetrieveProxy(proxyName)
end

function Facade:RemoveProxy(proxyName)
	return self.m_model:RemoveProxy(proxyName)
end

function Facade:HasProxy(proxyName)
	return self.m_model:HasProxy(proxyName)
end

function Facade:RegisterCommand(notificationName, command)
	return self.m_controller:RegisterCommand(notificationName, command)
end

function Facade:RemoveCommand(notificationName)
	return self.m_controller:RemoveCommand(notificationName)
end

function Facade:HasCommand(notificationName)
	return self.m_controller:HasCommand(notificationName)
end

function Facade:RegisterMediator(mediator)
	return self.m_view:RegisterMediator(mediator)
end

function Facade:RetrieveMediator(mediatorName)
	return self.m_view:RetrieveMediator(mediatorName)
end

function Facade:RemoveMediator(mediatorName)
	return self.m_view:RemoveMediator(mediatorName)
end

function Facade:HasMediator(mediatorName)
	return self.m_view:HasMediator(mediatorName)
end

function Facade:NotifyObservers(notification)
	return self.m_view:NotifyObservers(notification)
end

function Facade:SendNotification(notificationName, body, type)
	self:NotifyObservers(Notification:new(notificationName, body, type))
end

function Facade.HasCore(key)
	return Facade.m_instanceMap[key] ~= nil
end

function Facade.RemoveCore(key)
	if Facade.HasCore(key) then
		Facade.m_instanceMap[key] = nil
		Model.RemoveModel(key)
        Controller.RemoveController(key)
        View.RemoveView(key)
	end
end

function Facade.BroadcastNotification(notification)
	for k ,v in pairs(Facade.m_instanceMap) do
		v:NotifyObservers(notification)
	end
end
