require "puremvc/core/View"
require "puremvc/patterns/Mediator/Mediator"
require "puremvc/patterns/Observer/Observer"
require "test/core/ViewTestNote"
require "test/core/ViewTestMediator"
require "test/core/ViewTestMediator4"
require "test/passert"

local TestCase = {}
local key = "DefaultKey"
local viewTestVars = {}

TestCase.onRegisterCalled = false
TestCase.onRemoveCalled = false

TestCase["View.GetInstance()"] = function()
	local view = View.GetInstance(key)
  passert.equalNotNil("Expecting instance implements IView", view)
end

function ViewTestMethod(note)
  local name = "ViewTestMethod"
  viewTestVars[name] = nil
  viewTestVars[name] = note:GetBody()
end

TestCase["RegisterAndNotifyObserver"] = function()
  local view = View.GetInstance(key)
  local observer = Observer:new(ViewTestMethod, TestCase)  
  local name = "ViewTestMethod"
	viewTestVars[name] = nil
  view:RegisterObserver(ViewTestNote.NAME .. name, observer)  
  local notification = ViewTestNote.Create(name, 10)
  view:NotifyObservers(notification)
  passert.equal("Expecting viewTestVars.ContainsKey(name)", viewTestVars[name] ~= nil, true)
  passert.equal("Expecting viewTestVar[name] = 10", viewTestVars[name] == 10, true)
  view:RemoveObserver(ViewTestNote.NAME .. name, self)
end

TestCase["RegisterAndRetrieveMediator"] = function()
  local view = View.GetInstance(key)
  local viewTestMediator = ViewTestMediator:new("RegisterAndRetrieveMediator", TestCase)
  local name = viewTestMediator:GetMediatorName()
  view:RegisterMediator(viewTestMediator)
  local mediator = view:RetrieveMediator(name) 			
  passert.equalNotNil("Expecting comp is ViewTestMediator", mediator)
  view:RemoveMediator(name)
end

TestCase["HasMediator"] = function()
  local view = View.GetInstance(key)
  local mediator = Mediator:new("HasMediator", TestCase)
  view:RegisterMediator(mediator)
  passert.equal("Expecting view.hasMediator(name) == true", view:HasMediator("HasMediator"), true)	
  view:RemoveMediator("HasMediator")
  passert.equal("Expecting view.hasMediator(name) == false", view:HasMediator("HasMediator"), false)	
end

TestCase["RegisterAndRemoveMediator"] = function()
  local view = View.GetInstance(key)
  local mediator = Mediator:new("Testing", TestCase)
  view:RegisterMediator(mediator)
  local removedMediator = view:RemoveMediator("Testing")
  passert.equal("Expecting removedMediator.MediatorName == name", removedMediator:GetMediatorName() == "Testing", true)	
  passert.equalNil("Expecting view.retrieveMediator(name) == null", view:RetrieveMediator("Testing"))	
  view:RemoveMediator("Testing")
end

TestCase["OnRegisterAndOnRemove"] = function()
  local view = View.GetInstance(key)
  local mediator = ViewTestMediator4:new("Testing", TestCase)
  local name = mediator:GetMediatorName()
  view:RegisterMediator(mediator)
  local removedMediator = view:RemoveMediator("Testing")
  passert.equal("Expecting onRegisterCalled == true", TestCase.onRegisterCalled, true)	
  view:RemoveMediator(name)
  passert.equal("Expecting onRemoveCalled == true", TestCase.onRemoveCalled, true)	
end

for _, case in pairs(TestCase) do
	print(_ .. ':')
  if type(case) == "function" then
    case()
  end
	print('========================')	
end