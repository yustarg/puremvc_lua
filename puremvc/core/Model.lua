local class = require 'middleclass'

Model = class('Model', IModel) 

Model.static.m_instanceMap = {}
Model.static.MULTITON_MSG = "Model instance for this Multiton key already constructed!"

function Model:initialize(key)
	if Model.m_instanceMap[key] ~= nil then
		error(Model.MULTITON_MSG)
	end
	self.m_multitonKey = key
	Model.m_instanceMap[key] = self
	self.m_proxyMap = {}
	self:InitializeModel()
end

function Model:InitializeModel()
	
end

function Model.GetInstance(key)
	if Model.m_instanceMap[key] ~= nil then
		return Model.m_instanceMap[key]
	end
	Model.m_instanceMap[key] = Model:new(key)
	return Model.m_instanceMap[key]
end

-- implement of IModel
function Model:RegisterProxy(proxy)
    proxy:InitializeNotifier(self.m_multitonKey)
    self.m_proxyMap[proxy.ProxyName] = proxy
    proxy:OnRegister()
end

function Model:RetrieveProxy(proxyName)
    return self.m_proxyMap[proxyName]
end

function Model:RemoveProxy(proxyName)
	if self.m_proxyMap[proxyName] == nil then return end
    local proxy = self.m_proxyMap[proxyName]
    proxy:OnRemove()
    return proxy
end

function Model:HasProxy(proxyName)
	return self.m_proxyMap[proxyName] ~= nil
end

function Model:ListMediatorNames()
	local keys = {}
	for k, v in pairs(self.m_proxyMap) do
		table.insert(keys, k)
	end
	return keys
end

function Model.RemoveModel(key)
    Model.m_instanceMap[key] = nil
end