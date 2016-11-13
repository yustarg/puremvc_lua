require "puremvc/patterns/Observer/Notifier"
local class = require 'middleclass'

Proxy = class('Proxy', Notifier) 

Proxy.static.NAME = "Proxy"

function Proxy:initialize(proxyName, data)
	self.m_proxyName = proxyName
	self.data = data
end

function Proxy:GetProxyName()
	return self.m_proxyName
end

function Proxy:SetData(data)
	self.data = data
end

function Proxy:GetData()
	return self.data
end

function Proxy:OnRegister()
	-- body
end

function Proxy:OnRemove()
	-- body
end