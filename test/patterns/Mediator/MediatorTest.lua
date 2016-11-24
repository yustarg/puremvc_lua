require "puremvc/patterns/Mediator/Mediator"
require "test/passert"

local TestCase = {}

TestCase["NameAccessor"] = function()
  -- Create a new Mediator and use accessors to set the mediator name 
  local mediator = Mediator:new("TestMediator")
  -- test assertions	
  passert.equal("Expecting mediator.MediatorName == 'TestMediator'", mediator:GetMediatorName() == "TestMediator", true)
end

TestCase["ViewAccessor"] = function()
  -- Create a new Mediator and use accessors to set the mediator name 
  local mediator = Mediator:new("TestMediator", {})
  -- test assertions	
  passert.equalNotNil("Expecting mediator.ViewComponent not null", mediator:GetViewComponent())
end

for _, case in pairs(TestCase) do
	print(_ .. ':')
	if type(case) == "function" then
	case()
	end
	print('========================')	
end