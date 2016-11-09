local IController = require 'Interfaces/IController.lua'
local Observer = require 'Patterns/Observer/Observer.lua'
local View = require 'View.lua'
local class = require 'middleclass.lua'

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

function IController:RegisterCommand(notificationName, command)
	if self.m_commandMap[notificationName] == nil then
		self.m_view:RegisterObserver(notificationName, Observer:new("executeCommand", self))
	end
	command:InitializeNotifier(self.m_multitonKey)
    self.m_commandMap[notificationName] = command
end

function Controller:ExecuteCommand(notification)
	if self.m_commandMap[notification.Name] == nil return
    local command = self.m_commandMap[notification.Name]
    command:InitializeNotifier(self.m_multitonKey)
    command:Execute(notification)
end

function IController:RemoveCommand(notificationName)
	if self.m_commandMap[notificationName] == nil return nil end
 	self.m_view:RemoveObserver(notificationName, self)
    local command = self.m_commandMap[notificationName]
   	self.m_commandMap[notificationName] = nil
    return command
end

function IController:HasCommand(notificationName)
	return self.m_commandMap[notificationName] ~= nil
end

function IController:ListNotificationNames()
	local keys = {}
	for k, v in pairs(self.m_commandMap) do
		table.insert(keys, k)
	end
	return keys
end