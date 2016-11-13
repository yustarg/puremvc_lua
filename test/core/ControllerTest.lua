require "puremvc/core/Controller"
require "puremvc/core/View"
require "puremvc/patterns/Observer/Notification"
require "test/core/ControllerTestCommand"
require "test/core/ControllerTestCommand2"
require "test/core/ControllerTestVO"
require "test/passert"

local TestCase = {}
local key = "DefaultKey"

TestCase["Controller.GetInstance()"] = function()
	local controller = Controller.GetInstance(key)
  passert.equalNotNil("Expecting instance implements IController", controller)
end

TestCase["RegisterAndExecuteCommand()"] = function()
  local controller = Controller.GetInstance(key)
  local name = "ControllerTest"
  controller:RegisterCommand(name, ControllerTestCommand:new())
  local vo = ControllerTestVO:new(12)
  local note = Notification:new(name, vo)
  controller:ExecuteCommand(note)
  passert.equal("Expecting vo.result == 24", vo.result, 24)
end

TestCase["RegisterAndRemoveCommand()"] = function()
  local controller = Controller.GetInstance(key)
	local name = "ControllerRemoveTest"
  controller:RegisterCommand(name, ControllerTestCommand:new())
  local vo = ControllerTestVO:new(12)
  local note = Notification:new(name, vo)
  controller:ExecuteCommand(note)
  passert.equal("Expecting vo.result == 24", vo.result, 24)
  
  vo.result = 0
  controller:RemoveCommand(name)
  controller:ExecuteCommand(note)
  passert.equal("Expecting vo.result == 0", vo.result, 0);
end

TestCase["HasCommand()"] = function()
  local controller = Controller.GetInstance(key)
  local name = "HasCommandTest"
  controller:RegisterCommand(name, ControllerTestCommand:new())
  passert.equal("Expecting controller.HasCommand(name) == true", controller:HasCommand(name), true)
  controller:RemoveCommand(name)
  passert.equal("Expecting controller.HasCommand(name) == false", controller:HasCommand(name), false)
end

TestCase["ReregisterAndExecuteCommand()"] = function()
  local controller = Controller.GetInstance(key)
  local name = "ControllerTest2"
  controller:RegisterCommand(name, ControllerTestCommand2:new())
  controller:RemoveCommand(name)  
  controller:RegisterCommand(name, ControllerTestCommand2:new())
  local vo = ControllerTestVO:new(12)
  local note = Notification:new(name, vo)
  local view = View.GetInstance(key)
  view:NotifyObservers(note)
  passert.equal("Expecting vo.result == 24", vo.result, 24)
  view:NotifyObservers(note)
  passert.equal("Expecting vo.result == 48", vo.result, 48)
end

for _, case in pairs(TestCase) do
	print(_ .. ':')
	case()
	print('========================')	
end