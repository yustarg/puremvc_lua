local class = require 'middleclass.lua'

IProxy = class('IProxy')

function IProxy:initialize(proxyName, data)
	self.m_proxyName = proxyName
	self.data = data
end

function IProxy:GetProxyName()
	return self.m_proxyName
end

function IProxy:SetData(data)
	self.data = data
end

function IProxy:GetData()
	return self.data
end

function IProxy:OnRegister()
	print("to implement in subclass")
end

function IProxy:OnRemove()
	print("to implement in subclass")
end