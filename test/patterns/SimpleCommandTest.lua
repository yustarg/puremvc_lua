require "puremvc/patterns/Observer/Notification"
require "test/patterns/SimpleCommandTestVO"
require "test/patterns/SimpleCommandTestCommand"
require "test/passert"

local TestCase = {}

TestCase["SimpleCommandExecute"] = function()
	local vo = SimpleCommandTestVO:new(5)
	local command = SimpleCommandTestCommand:new()
  	local note = Notification:new("SimpleCommandTestNote", vo)
    command:Execute(note)
  	passert.equal("Expecting vo.result1 == 10", vo.result == 10, true)
end

for _, case in pairs(TestCase) do
	print(_ .. ':')
	if type(case) == "function" then
	case()
	end
	print('========================')	
end