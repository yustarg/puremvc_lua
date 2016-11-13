require "puremvc/patterns/Proxy/Proxy"
local class = require "middleclass"

ModelTestProxy = class("ModelTestProxy", Proxy)

ModelTestProxy.static.NAME = "ModelTestProxy"
ModelTestProxy.static.ON_REGISTER_CALLED = "onRegister Called"
ModelTestProxy.static.ON_REMOVE_CALLED = "onRemove Called"

function ModelTestProxy:initialize()
		Proxy:initialize(ModelTestProxy.NAME, "")
end

function ModelTestProxy:OnRegister()
		self:SetData(ModelTestProxy.ON_REGISTER_CALLED)
end

function ModelTestProxy:OnRemove()
		self:SetData(ModelTestProxy.ON_REMOVE_CALLED)
end