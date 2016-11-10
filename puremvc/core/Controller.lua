require 'puremvc/interfaces/IController'
require 'puremvc/patterns/Observer/Observer'
require 'puremvc/core/View'

local class = require 'middleclass'

Controller = class('Controller', IController) 

Controller.static.m_instanceMap = {}
Controller.static.MULTITON_MSG = "Controller instance for this Multiton key already constructed!"

function Controller:initialize(key)
	if Controller.m_instanceMap[key] ~= nil then
		error(Controller.MULTITON_MSG)
	end
	self.m_multitonKey = key
	Controller.m_instanceMap[key] = self
	self.m_commandMap = {}
	self:InitializeController()
end

function Controller:InitializeController()
	self.m_view = View.GetInstance(self.m_multitonKey)
end

function Controller.GetInstance(key)
	if Controller.m_instanceMap[key] ~= nil then
		return Controller.m_instanceMap[key]
	end
	Controller.m_instanceMap[key] = Controller:new(key)
	return Controller.m_instanceMap[key]
end

-- implement of IController

function Controller:RegisterCommand(notificationName, command)
	if self.m_commandMap[notificationName] == nil then
		self.m_view:RegisterObserver(notificationName, Observer:new("executeCommand", self))
	end
	command:InitializeNotifier(self.m_multitonKey)
    self.m_commandMap[notificationName] = command
end

function Controller:ExecuteCommand(notification)
	if self.m_commandMap[notification.Name] == nil then return end
    local command = self.m_commandMap[notification.Name]
    command:InitializeNotifier(self.m_multitonKey)
    command:Execute(notification)
end

function Controller:RemoveCommand(notificationName)
	if self.m_commandMap[notificationName] == nil then return end
 	self.m_view:RemoveObserver(notificationName, self)
    local command = self.m_commandMap[notificationName]
   	self.m_commandMap[notificationName] = nil
    return command
end

function Controller:HasCommand(notificationName)
	return self.m_commandMap[notificationName] ~= nil
end

function Controller:ListNotificationNames()
	local keys = {}
	for k, v in pairs(self.m_commandMap) do
		table.insert(keys, k)
	end
	return keys
end

function Controller.RemoveController(key)
	Controller.m_instanceMap[key] = nil
end