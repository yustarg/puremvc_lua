require "puremvc/core/View"
require "puremvc/patterns/Mediator/Mediator"
require "puremvc/patterns/Observer/Observer"
require "puremvc/patterns/Observer/Notification"
require "test/core/ViewTestNote"
require "test/core/ViewTestMediator"
require "test/core/ViewTestMediator2"
require "test/core/ViewTestMediator3"
require "test/core/ViewTestMediator4"
require "test/core/ViewTestMediator5"
require "test/core/ViewTestMediator6"
require "test/passert"

local TestCase = {}
local key = "DefaultKey"
local viewTestVars = {}

TestCase.lastNotification = ""
TestCase.counter = 0
TestCase.onRegisterCalled = false
TestCase.onRemoveCalled = false

ViewTest = {}
ViewTest.NOTE1 = "Notification1"
ViewTest.NOTE2 = "Notification2"
ViewTest.NOTE3 = "Notification3"
ViewTest.NOTE4 = "Notification4"
ViewTest.NOTE5 = "Notification5"
ViewTest.NOTE6 = "Notification6"

TestCase["View.GetInstance()"] = function()
	local view = View.GetInstance(key)
  passert.equalNotNil("Expecting instance implements IView", view)
end

-- function ViewTest:ViewTestMethod(note)
--   local name = "ViewTestMethod"
--   viewTestVars[name] = nil
--   viewTestVars[name] = note:GetBody()
-- end

-- TestCase["RegisterAndNotifyObserver"] = function()
--   local view = View.GetInstance(key)
--   local observer = Observer:new(ViewTest.ViewTestMethod, ViewTest)  
--   local name = "ViewTestMethod"
-- 	viewTestVars[name] = nil
--   view:RegisterObserver(ViewTestNote.NAME .. name, observer)  
--   local notification = ViewTestNote.Create(name, 10)
--   view:NotifyObservers(notification)
--   passert.equal("Expecting viewTestVars.ContainsKey(name)", viewTestVars[name] ~= nil, true)
--   passert.equal("Expecting viewTestVar[name] = 10", viewTestVars[name] == 10, true)
--   view:RemoveObserver(ViewTestNote.NAME .. name, self)
-- end

-- TestCase["RegisterAndRetrieveMediator"] = function()
--   local view = View.GetInstance(key)
--   local viewTestMediator = ViewTestMediator:new("RegisterAndRetrieveMediator", TestCase)
--   local name = viewTestMediator:GetMediatorName()
--   view:RegisterMediator(viewTestMediator)
--   local mediator = view:RetrieveMediator(name) 			
--   passert.equalNotNil("Expecting comp is ViewTestMediator", mediator)
--   view:RemoveMediator(name)
-- end

-- TestCase["HasMediator"] = function()
--   local view = View.GetInstance(key)
--   local mediator = Mediator:new("HasMediator", TestCase)
--   view:RegisterMediator(mediator)
--   passert.equal("Expecting view.hasMediator(name) == true", view:HasMediator("HasMediator"), true)	
--   view:RemoveMediator("HasMediator")
--   passert.equal("Expecting view.hasMediator(name) == false", view:HasMediator("HasMediator"), false)	
-- end

-- TestCase["RegisterAndRemoveMediator"] = function()
--   local view = View.GetInstance(key)
--   local mediator = Mediator:new("Testing", TestCase)
--   view:RegisterMediator(mediator)
--   local removedMediator = view:RemoveMediator("Testing")
--   passert.equal("Expecting removedMediator.MediatorName == name", removedMediator:GetMediatorName() == "Testing", true)	
--   passert.equalNil("Expecting view.retrieveMediator(name) == null", view:RetrieveMediator("Testing"))	
--   view:RemoveMediator("Testing")
-- end

-- TestCase["OnRegisterAndOnRemove"] = function()
--   local view = View.GetInstance(key)
--   local mediator = ViewTestMediator4:new("Testing", TestCase)
--   local name = mediator:GetMediatorName()
--   view:RegisterMediator(mediator)
--   local removedMediator = view:RemoveMediator("Testing")
--   passert.equal("Expecting onRegisterCalled == true", TestCase.onRegisterCalled, true)	
--   view:RemoveMediator(name)
--   passert.equal("Expecting onRemoveCalled == true", TestCase.onRemoveCalled, true)	
-- end


-- TestCase["SuccessiveRegisterAndRemoveMediator"] = function()
--   local view = View.GetInstance(key)
--   local mediator = ViewTestMediator:new("Testing", TestCase)
--   local name = mediator:GetMediatorName()
--   view:RegisterMediator(mediator)
--   local retrivedmediator = view:RetrieveMediator(name)
--   passert.equal("Expecting view.retrieveMediator( ViewTestMediator.NAME ) is ViewTestMediator", retrivedmediator:isInstanceOf(ViewTestMediator), true)	
--   view:RemoveMediator(name)
--   local retrivedmediator = view:RetrieveMediator(name)
--   passert.equalNil("Expecting view.retrieveMediator( ViewTestMediator.NAME ) == null", retrivedmediator)	
--   view:RemoveMediator(name);
  
--   local mediator = ViewTestMediator:new("Testing", TestCase)
--   local name = mediator:GetMediatorName()
--   view:RegisterMediator(mediator)
--   passert.equal("Expecting view.retrieveMediator( ViewTestMediator.NAME ) is ViewTestMediator", view:RetrieveMediator(name):isInstanceOf(ViewTestMediator), true)	
--   view:RemoveMediator(name)
--   passert.equalNil("Expecting view.retrieveMediator( ViewTestMediator.NAME ) == null", view:RetrieveMediator(name))	
-- end  

-- TestCase["RemoveMediatorAndSubsequentNotify"] = function()
--   local view = View.GetInstance(key)
--   view:RegisterMediator(ViewTestMediator2:new(TestCase))
--   local viewTestMediator = ViewTestMediator:new("Testing", TestCase)
--   view:RegisterMediator(viewTestMediator)
--   view:NotifyObservers(Notification:new(ViewTest.NOTE1))
--   passert.equal("Expecting lastNotification == NOTE1",  TestCase.lastNotification == ViewTest.NOTE1, true)	
--   view:NotifyObservers(Notification:new(ViewTest.NOTE2))
--   passert.equal("Expecting lastNotification == NOTE2",  TestCase.lastNotification == ViewTest.NOTE2, true)	
--   view:RemoveMediator(ViewTestMediator2.NAME)
--   passert.equalNil("Expecting view.retrieveMediator(ViewTestMediator2.NAME) == null", view:RetrieveMediator(ViewTestMediator2.NAME))	
--   TestCase.lastNotification = nil
--   view:NotifyObservers(Notification:new(ViewTest.NOTE1))
--   passert.equal("Expecting lastNotification != NOTE1",  TestCase.lastNotification ~= ViewTest.NOTE1, true)
-- 	view:NotifyObservers(Notification:new(ViewTest.NOTE2))
--   passert.equal("Expecting lastNotification != NOTE2",  TestCase.lastNotification ~= ViewTest.NOTE2, true)  
-- end    

-- TestCase["RemoveOneOfTwoMediatorsAndSubsequentNotify"] = function()
--   local view = View.GetInstance(key)
--   view:RegisterMediator(ViewTestMediator2:new(TestCase))
--   view:RegisterMediator(ViewTestMediator3:new(TestCase))
--   view:NotifyObservers(Notification:new(ViewTest.NOTE1))
--   passert.equal("Expecting lastNotification == NOTE1",  TestCase.lastNotification == ViewTest.NOTE1, true)	
--   view:NotifyObservers(Notification:new(ViewTest.NOTE2))
--   passert.equal("Expecting lastNotification == NOTE2",  TestCase.lastNotification == ViewTest.NOTE2, true)	
--   view:NotifyObservers(Notification:new(ViewTest.NOTE3))
--   passert.equal("Expecting lastNotification == NOTE3",  TestCase.lastNotification == ViewTest.NOTE3, true)	
--   view:RemoveMediator(ViewTestMediator2.NAME)
--   passert.equalNil("Expecting view.retrieveMediator(ViewTestMediator2.NAME) == null", view:RetrieveMediator(ViewTestMediator2.NAME))	
--   TestCase.lastNotification = nil
--   view:NotifyObservers(Notification:new(ViewTest.NOTE1))
--   passert.equal("Expecting lastNotification != NOTE1",  TestCase.lastNotification ~= ViewTest.NOTE1, true)
-- 	view:NotifyObservers(Notification:new(ViewTest.NOTE2))
--   passert.equal("Expecting lastNotification != NOTE2",  TestCase.lastNotification ~= ViewTest.NOTE2, true)  
--   view:NotifyObservers(Notification:new(ViewTest.NOTE3))
--   passert.equal("Expecting lastNotification == NOTE3",  TestCase.lastNotification == ViewTest.NOTE3, true)  
-- end

-- TestCase["MediatorReregistration"] = function()
--   -- Get the Singleton View instance
--   local view = View.GetInstance(key)
--   -- Create and register that responds to notification 5
--   view:RegisterMediator(ViewTestMediator5:new(TestCase))
--   -- try to register another instance of that mediator (uses the same NAME constant).
--   view:RegisterMediator(ViewTestMediator5:new(TestCase))
--   -- test that the counter is only incremented once (mediator 5's response) 
--   TestCase.counter = 0
--   view:NotifyObservers(Notification:new(ViewTest.NOTE5))
--   passert.equal("Expecting counter == 1", TestCase.counter == 1, true)  
--   -- Remove the Mediator 
--   view:RemoveMediator(ViewTestMediator5.NAME)
--   -- test that retrieving it now returns null			
--   passert.equal("Expecting view.retrieveMediator( ViewTestMediator5.NAME ) == null", view:RetrieveMediator( ViewTestMediator5.NAME ) == nil, true)
--   -- test that the counter is no longer incremented  
-- 	TestCase.counter = 0
--   view:NotifyObservers(Notification:new(ViewTest.NOTE5))
--   passert.equal("Expecting counter == 0", TestCase.counter == 0, true)
-- end
  
TestCase["ModifyObserverListDuringNotification"] = function()
  -- Get the Singleton View instance
  local view = View.GetInstance(key)
  --[[Create and register several mediator instances that respond to notification 6 
			by removing themselves, which will cause the observer list for that notification 
			to change. versions prior to Standard Version 2.0.4 will see every other mediator
			fails to be notified.  --]]
  view:RegisterMediator( ViewTestMediator6:new("ViewTestMediator6/1", TestCase ) )
  view:RegisterMediator( ViewTestMediator6:new("ViewTestMediator6/2", TestCase ) )
  view:RegisterMediator( ViewTestMediator6:new("ViewTestMediator6/3", TestCase ) )
  view:RegisterMediator( ViewTestMediator6:new("ViewTestMediator6/4", TestCase ) )
  view:RegisterMediator( ViewTestMediator6:new("ViewTestMediator6/5", TestCase ) )
  view:RegisterMediator( ViewTestMediator6:new("ViewTestMediator6/6", TestCase ) )
  view:RegisterMediator( ViewTestMediator6:new("ViewTestMediator6/7", TestCase ) )
  view:RegisterMediator( ViewTestMediator6:new("ViewTestMediator6/8", TestCase ) )
  -- clear the counter
  TestCase.counter = 0
  --[[send the notification. each of the above mediators will respond by removing
			themselves and incrementing the counter by 1. This should leave us with a
			count of 8, since 8 mediators will respond.--]]
  view:NotifyObservers(Notification:new(ViewTest.NOTE6))
  -- verify the count is correct
  print("TestCase.counter" ..TestCase.counter)
  passert.equal("Expecting counter == 8", TestCase.counter == 8, true)  
  -- clear the counter
	TestCase.counter = 0
  view:NotifyObservers(Notification:new(ViewTest.NOTE6))
  passert.equal("Expecting counter == 0", TestCase.counter == 0, true)
end
			
for _, case in pairs(TestCase) do
	print(_ .. ':')
  if type(case) == "function" then
    case()
  end
	print('========================')	
end