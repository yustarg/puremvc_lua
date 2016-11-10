local class = require 'middleclass'

Proxy = class('Proxy', IProxy) 

Proxy.static.NAME = "Proxy"

function Proxy:initialize(ProxyName, data)
	IProxy:initialize(ProxyName or Proxy.NAME, data)
end

function Proxy:OnRegister()
	-- body
end

function Proxy:OnRemove()
	-- body
end