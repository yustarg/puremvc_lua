require "puremvc/core/View"
require "puremvc/patterns/Observer/Observer"
require "test/core/ViewTestNote"
require "test/passert"
local TestCase = {}
local key = "DefaultKey"
local viewTestVars = {}

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

-- TestCase["RegisterAndRetrieveMediator"] = function()
--   local view = View.GetInstance(key)
--   local observer = Observer:new(ViewTestMethod, TestCase)  
--   local name = "ViewTestMethod"
-- 	viewTestVars[name] = nil
--   view:RegisterObserver(ViewTestNote.NAME .. name, observer)  
--   local notification = ViewTestNote.Create(name, 10)
--   view:NotifyObservers(notification)
--   passert.equal("Expecting viewTestVars.ContainsKey(name)", viewTestVars[name] ~= nil, true)
--   passert.equal("Expecting viewTestVar[name] = 10", viewTestVars[name] == 10, true)
--   view:RemoveObserver(ViewTestNote.NAME .. name, self)
-- end


for _, case in pairs(TestCase) do
	print(_ .. ':')
	case()
	print('========================')	
end