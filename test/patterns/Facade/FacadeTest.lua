require "puremvc/patterns/Observer/Notification"
require "puremvc/patterns/Mediator/Mediator"
require "puremvc/patterns/Facade/Facade"
require "puremvc/patterns/Proxy/Proxy"
require "test/patterns/Facade/FacadeTestCommand"
require "test/patterns/Facade/FacadeTestVO"
require "test/passert"

local TestCase = {}
local key = "DefaultKey"

TestCase["GetInstance"] = function()
	local facade = Facade.GetInstance(key)
  	passert.equalNotNil("Expecting instance not null", facade)
end

TestCase["RegisterCommandAndNotifyObservers"] = function()
	-- Create the Facade, register the FacadeTestCommand to 
  -- handle 'FacadeTest' events
  local facade = Facade.GetInstance(key)
  facade:RegisterCommand("FacadeTestNote", FacadeTestCommand:new())
  -- Send notification. The Command associated with the event
  -- (FacadeTestCommand) will be invoked, and will multiply 
	-- the vo.input value by 2 and set the result on vo.result
  local vo = FacadeTestVO:new(32)
  facade:SendNotification("FacadeTestNote", vo)
  -- test assertions	
  passert.equal("Expecting vo.result == 64", vo.result == 64, true)
end

TestCase["RegisterAndRemoveCommandAndSendNotification"] = function()
	-- Create the Facade, register the FacadeTestCommand to 
  -- handle 'FacadeTest' events
  local facade = Facade.GetInstance(key)
  facade:RegisterCommand("FacadeTestNote", FacadeTestCommand:new())
  facade:RemoveCommand("FacadeTestNote")
  -- Send notification. The Command associated with the event
	-- (FacadeTestCommand) will NOT be invoked, and will NOT multiply 
	-- the vo.input value by 2 
  local vo = FacadeTestVO:new(32)
  facade:SendNotification("FacadeTestNote", vo)
  -- test assertions	
  passert.equal("Expecting vo.result ~= 64", vo.result ~= 64, true)
end

TestCase["RegisterAndRetrieveProxy"] = function()
	-- register a proxy and retrieve it.
  local facade = Facade.GetInstance(key)
  facade:RegisterProxy(Proxy:new("colors", { "red", "green", "blue" }))
  local proxy = facade:RetrieveProxy("colors")
  
  -- test assertions	
  passert.equalNotNil("Expecting proxy is IProxy", proxy)
  
  -- retrieve data from proxy
  local data = proxy:GetData()
  -- test assertions	
  passert.equalNotNil("Expecting data not null", data)
  passert.equal("Expecting data.Count == 3", #data == 3, true)
  passert.equal("Expecting data[1] == 'red", data[1] == "red", true)
  passert.equal("Expecting data[2] == 'green", data[2] == "green", true)
  passert.equal("Expecting data[3] == 'blue", data[3] == "blue", true)
end		
  
TestCase["RegisterAndRemoveProxy"] = function()
	-- register a proxy, remove it, then try to retrieve it
  local facade = Facade.GetInstance(key)
  facade:RegisterProxy(Proxy:new("sizes", { 7, 13, 21 }))
  local proxy = facade:RemoveProxy("sizes")
  -- test assertions	
  passert.equal("Expecting removedProxy.ProxyName == 'sizes'", proxy:GetProxyName() == "sizes", true)
  
  local proxy = facade:RemoveProxy("sizes")
  -- test assertions	
  passert.equalNil("Expecting proxy is null", proxy)
end	

TestCase["RegisterRetrieveAndRemoveMediator"] = function()
	-- register a mediator, remove it, then try to retrieve it
  local facade = Facade.GetInstance(key)
  facade:RegisterMediator(Mediator:new(Mediator.NAME, {}))
  -- retrieve the mediator	
  passert.equalNotNil("Expecting mediator is not null", facade:RetrieveMediator(Mediator.NAME))
  -- remove the mediator
  local removedMediator = facade:RemoveMediator(Mediator.NAME)
  -- assert that we have removed the appropriate mediator
  passert.equal("Expecting removedMediator.MediatorName == Mediator.NAME", removedMediator:GetMediatorName() == Mediator.NAME, true)
  -- assert that the mediator is no longer retrievable
  passert.equal("Expecting facade.retrieveMediator(Mediator.NAME) == null )", facade:RetrieveMediator( Mediator.NAME ) == nil, true)
end	
		  
TestCase["HasProxy"] = function()
	-- register a Proxy
  local facade = Facade.GetInstance(key)
  facade:RegisterProxy(Proxy:new("hasProxyTest", { 1, 2, 3 }))
  -- assert that the model.hasProxy method returns true
  -- for that proxy name
  passert.equal("Expecting facade.hasProxy('hasProxyTest') == true", facade:HasProxy("hasProxyTest"), true)
end

TestCase["HasMediator"] = function()
	-- register a Mediator
  local facade = Facade.GetInstance(key)
  facade:RegisterMediator(Mediator:new("facadeHasMediatorTest", {}))
  -- assert that the facade.hasMediator method returns true
  -- for that mediator name
  passert.equal("Expecting facade.hasMediator('facadeHasMediatorTest') == true", facade:HasMediator("facadeHasMediatorTest"), true)
  facade:RemoveMediator( "facadeHasMediatorTest" )
  -- assert that the facade.hasMediator method returns false
  -- for that mediator name
  passert.equal("Expecting facade.hasMediator('facadeHasMediatorTest') == false", facade:HasMediator("facadeHasMediatorTest"), false)
end

TestCase["HasCommand"] = function()
	-- register the ControllerTestCommand to handle 'hasCommandTest' notes
  local facade = Facade.GetInstance(key)
  facade:RegisterCommand("facadeHasCommandTest", FacadeTestCommand:new())
  -- test that hasCommand returns true for hasCommandTest notifications 
  passert.equal("Expecting facade.hasCommand('facadeHasCommandTest') == true", facade:HasCommand("facadeHasCommandTest"), true)
  facade:RemoveCommand( "facadeHasCommandTest" )
  -- assert that the facade.hasMediator method returns false
  -- for that mediator name
  passert.equal("Expecting facade.hasMediator('facadeHasCommandTest') == false", facade:HasCommand("facadeHasCommandTest"), false)
end

for _, case in pairs(TestCase) do
	print(_ .. ':')
	if type(case) == "function" then
	case()
	end
	print('========================')	
end