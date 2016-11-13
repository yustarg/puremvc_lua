require "puremvc/core/Model"
require "puremvc/core/View"
require "puremvc/patterns/Proxy/Proxy"
require "test/core/ModelTestProxy"
require "test/core/ControllerTestCommand2"
require "test/core/ControllerTestVO"
require "test/passert"

local TestCase = {}
local key = "DefaultKey"

TestCase["Model.GetInstance()"] = function()
	local model = Model.GetInstance(key)
  passert.equalNotNil("Expecting instance implements IModel", model)
end

TestCase["RegisterAndRetrieveProxy()"] = function()
  local model = Model.GetInstance(key)
  local name = "colors"
  model:RegisterProxy(Proxy:new(name, { "red", "green", "blue" }))
  local proxy = model:RetrieveProxy(name)
  local data = proxy:GetData()
  
  passert.equalNotNil("Expecting data not null", data)
  passert.equal("Expecting data.length == 3", #data, 3)
  passert.equal("Expecting data[1] == 'red'", data[1], 'red')
  passert.equal("Expecting data[2] == 'green'", data[2], 'green')
  passert.equal("Expecting data[3] == 'blue'", data[3], 'blue')
end

TestCase["RegisterAndRemoveProxy()"] = function()
  local model = Model.GetInstance(key)
  local name = "sizes"
  model:RegisterProxy(Proxy:new(name, {7, 13, 21}))
  local removedProxy = model:RemoveProxy(name)
  passert.equal("Expecting removedProxy.ProxyName == name", removedProxy:GetProxyName(), name)
  local proxy = model:RetrieveProxy(name)
  passert.equalNil("Expecting proxy is null", proxy)
end

TestCase["HasProxy()"] = function()
  local model = Model.GetInstance(key)
  local name = "aces"
  model:RegisterProxy(Proxy:new(name, {"clubs", "spades", "hearts", "diamonds"}))
  passert.equal("Expecting model.hasProxy(name) == true", model:HasProxy(name), true)
  model:RemoveProxy(name)
  passert.equal("Expecting model.hasProxy(name) == false", model:HasProxy(name), false)
end

TestCase["OnRegisterAndOnRemove()"] = function()
  local model = Model.GetInstance(key)
  local proxy = ModelTestProxy:new()
  model:RegisterProxy(proxy)
  passert.equal("Expecting proxy.Data.ToString() == ModelTestProxy.ON_REGISTER_CALLED", proxy:GetData() == ModelTestProxy.ON_REGISTER_CALLED, true)
  model:RemoveProxy(ModelTestProxy.NAME)
  passert.equal("Expecting proxy.Data.ToString() == ModelTestProxy.ON_REMOVE_CALLED", proxy:GetData() == ModelTestProxy.ON_REMOVE_CALLED, true)
end

for _, case in pairs(TestCase) do
	print(_ .. ':')
	case()
	print('========================')	
end