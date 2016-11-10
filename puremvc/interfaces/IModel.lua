local class = require 'middleclass'

IModel = class('IModel')

function IModel:RegisterProxy(proxy)
	print("to implement in subclass")
end

function IModel:RetrieveProxy(proxyName)
	print("to implement in subclass")
end

function IModel:RemoveProxy(proxyName)
	print("to implement in subclass")
end

function IModel:HasProxy(proxyName)
	print("to implement in subclass")
end

function IModel:ListProxyNames()
	print("to implement in subclass")
end