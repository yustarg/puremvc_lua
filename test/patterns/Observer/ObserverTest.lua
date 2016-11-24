require "puremvc/patterns/Observer/Observer"
require "puremvc/patterns/Observer/Notification"
require "test/passert"

local TestCase = {}
local Test = {}
function Test:TestMethod(note)
    Test.var = note:GetBody()
end

TestCase["ObserverAccessors"] = function()
  -- Create observer with null args, then
  -- use accessors to set notification method and context
  local observer = Observer:new(nil, nil)
  observer:SetNotifyContext(Test)
  observer:SetNotifyMethod(Test.TestMethod)
  			
  -- create a test event, setting a payload value and notify 
  -- the observer with it. since the observer is this class 
  -- and the notification method is observerTestMethod,
  -- successful notification will result in our local 
  -- observerTestVar being set to the value we pass in 
  -- on the notification body.
  local note = Notification:new("ObserverTestNote", 10)
  observer:NotifyObserver(note)
	-- test assertions  			
  passert.equal("Expecting observerTestVar = 10", Test.var == 10, true)
end

TestCase["ObserverConstructor"] = function()
  -- Create observer passing in notification method and context
  local observer = Observer:new(Test.TestMethod, Test)
  -- create a test notification, setting a body value and notify 
  --   the observer with it. since the observer is this class 
  -- and the notification method is observerTestMethod,
  -- successful notification will result in our local 
  -- observerTestVar being set to the value we pass in 
  -- on the notification body.
  local note = Notification:new("ObserverTestNote", 5)
  observer:NotifyObserver(note)
  -- test assertions	
  passert.equal("Expecting observerTestVar = 5", Test.var == 5, true)
end

TestCase["CompareNotifyContext"] = function()
  -- Create observer passing in notification method and context
  local observer = Observer:new("observerTestMethod", Test)
  local negTestObj = {}
  -- test assertions  
  passert.equal("Expecting observer.compareNotifyContext(negTestObj) == false", observer:CompareNotifyContext(negTestObj) == false, true)
  passert.equal("Expecting observer.compareNotifyContext(this) == true", observer:CompareNotifyContext(Test), true)
end

for _, case in pairs(TestCase) do
	print(_ .. ':')
	if type(case) == "function" then
	case()
	end
	print('========================')	
end