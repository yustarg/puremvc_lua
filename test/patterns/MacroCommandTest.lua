require "puremvc/patterns/Observer/Notification"
require "test/patterns/MacroCommandTestVO"
require "test/patterns/MacroCommandTestCommand"
require "test/passert"

local TestCase = {}

TestCase["MacroCommandExecute"] = function()
	local vo = MacroCommandTestVO:new(5)
	local command = MacroCommandTestCommand:new()
  	local note = Notification:new("MacroCommandTest", vo)
    command:Execute(note)
  	passert.equal("Expecting vo.result1 == 10", vo.result1 == 10, true)
  	passert.equal("Expecting vo.result1 == 25", vo.result2 == 25, true)
end

for _, case in pairs(TestCase) do
	print(_ .. ':')
	if type(case) == "function" then
	case()
	end
	print('========================')	
end