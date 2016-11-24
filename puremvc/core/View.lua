local class = require 'middleclass'

View = class('View', IView) 

View.static.m_instanceMap = {}
View.static.MULTITON_MSG = "View instance for this Multiton key already constructed!"

function View:initialize(key)
	if View.m_instanceMap[key] ~= nil then
		error(View.MULTITON_MSG)
	end
	self.m_multitonKey = key
	View.m_instanceMap[key] = self
	self.m_mediatorMap = {}
	self.m_observerMap = {}
	self:InitializeView()
end

function View:InitializeView()
	
end

function View.GetInstance(key)
	if View.m_instanceMap[key] ~= nil then
		return View.m_instanceMap[key]
	end
	View.m_instanceMap[key] = View:new(key)
	return View.m_instanceMap[key]
end

-- implement of IView
function View:RegisterObserver(notificationName, observer)
    if self.m_observerMap[notificationName] == nil then
       self.m_observerMap[notificationName] = {}
    end
    table.insert(self.m_observerMap[notificationName], observer) 
end

function View:RemoveObserver(notificationName, notifyContext)
	if self.m_observerMap[notificationName] == nil then return end
    local observers = self.m_observerMap[notificationName]
    for _, observer in pairs(observers) do
        if observer:CompareNotifyContext(notifyContext) then
        	table.remove(observers, _)
        	break
        end
    end

    if #observers == 0 then
        self.m_observerMap[notificationName] = nil
    end
end

function View:NotifyObservers(notification)
	if self.m_observerMap[notification:GetName()] ~= nil then
		local observers_ref = self.m_observerMap[notification:GetName()]
		for i = #observers_ref, 1, -1 do
			--print("View:NotifyObservers " .. observer:GetNotifyContext():GetMediatorName())
			observers_ref[i]:NotifyObserver(notification)
		end
	end
end

function View:RegisterMediator(mediator)
    if self.m_mediatorMap[mediator:GetMediatorName()] then return end
    mediator:InitializeNotifier(self.m_multitonKey)
    self.m_mediatorMap[mediator:GetMediatorName()] = mediator
    local interests = mediator:ListNotificationInterests()
    local observer = Observer:new(mediator.HandleNotification, mediator)
    for _, v in pairs(interests) do
        self:RegisterObserver(v, observer)
    end
    mediator:OnRegister()
end

function View:RetrieveMediator(mediatorName)
    return self.m_mediatorMap[mediatorName]
end

function View:RemoveMediator(mediatorName)
	if self.m_mediatorMap[mediatorName] == nil then return end
    local mediator = self.m_mediatorMap[mediatorName]
    local interests = mediator:ListNotificationInterests()
    for _, v in pairs(interests) do
        self:RemoveObserver(v, mediator)
    end	
    self.m_mediatorMap[mediatorName] = nil
    mediator:OnRemove()
    return mediator
end

function View:HasMediator(mediatorName)
	return self.m_mediatorMap[mediatorName] ~= nil
end

function View:ListMediatorNames()
	local keys = {}
	for k, v in pairs(self.m_mediatorMap) do
		table.insert(keys, k)
	end
	return keys
end

function View.RemoveView(key)
	View.m_instanceMap[key] = nil
end