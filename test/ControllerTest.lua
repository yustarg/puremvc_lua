-- package.path = package.path .. ';?.lua'
require "puremvc/core/Controller"
require "test/ModelTest"

local TestCase = {}

TestCase["Controller.GetInstance()"] = function()
	local key = "DefaultKey"
	local controller = Controller.GetInstance(key)
    assert(controller ~= nil, "Expecting instance implements IController")
end

for _, case in pairs(TestCase) do
	print(_ .. ':')
	case()
	print('========================')	
end