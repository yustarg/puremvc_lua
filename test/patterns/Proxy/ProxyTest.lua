require "puremvc/patterns/Proxy/Proxy"
require "test/passert"

local TestCase = {}

TestCase["NameAccessor"] = function()
  -- Create a new Proxy and use accessors to set the proxy name 
  local proxy = Proxy:new("TestProxy")
  -- test assertions	
  passert.equal("Expecting proxy.ProxyName == 'TestProxy'", proxy:GetProxyName() == "TestProxy", true)
end

TestCase["TestDataAccessors"] = function()
  -- Create a new Proxy and use accessors to set the data
  local proxy = Proxy:new("colors")
  proxy:SetData({ "red", "green", "blue" })
  local data = proxy:GetData()  
  -- test assertions	
  passert.equal("Expecting data.Count == 3", #data == 3, true)
  passert.equal("Expecting data[1] == 'red'", data[1] == "red", true)
  passert.equal("Expecting data[2] == 'red'", data[2] == "green", true)
  passert.equal("Expecting data[3] == 'red'", data[3] == "blue", true)
end

TestCase["TestConstructor"] = function()
  -- Create a new Proxy using the Constructor to set the name and data
  local proxy = Proxy:new("colors",{ "red", "green", "blue" })
  local data = proxy:GetData()  
   			
  -- test assertions
  passert.equalNotNil("Expecting proxy not null", proxy)
  passert.equal("Expecting proxy.ProxyName == 'colors'", proxy:GetProxyName() == "colors", true)
  passert.equal("Expecting data.Count == 3", #data == 3, true)
  passert.equal("Expecting data[1] == 'red'", data[1] == "red", true)
  passert.equal("Expecting data[2] == 'red'", data[2] == "green", true)
  passert.equal("Expecting data[3] == 'red'", data[3] == "blue", true)
end

for _, case in pairs(TestCase) do
	print(_ .. ':')
	if type(case) == "function" then
	case()
	end
	print('========================')	
end