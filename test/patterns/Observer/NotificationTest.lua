require "puremvc/patterns/Observer/Notification"
require "test/passert"

local TestCase = {}

TestCase["NameAccessor"] = function()
  -- Create a new Notification and use accessors to set the notification name 
  local note = Notification:new("TestNote")
  -- test assertions	
  passert.equal("Expecting note.Name == 'TestNote'", note:GetName() == "TestNote", true)
end

TestCase["BodyAccessors"] = function()
  -- Create a new Notification and use accessors to set the body 
  local note = Notification:new()
  note:SetBody(5)
  -- test assertions	
  passert.equal("Expecting (int) note.Body == 5", note:GetBody() == 5, true)
end

TestCase["TestConstructor"] = function()
  -- Create a new Notification using the Constructor to set the notification name and body
  local note = Notification:new("TestNote", 5, "TestNoteType")
  -- test assertions  
  passert.equal("Expecting note.Name == 'TestNote'", note:GetName() == "TestNote", true)
  passert.equal("Expecting (int) note.Body == 5", note:GetBody() == 5, true)
  passert.equal("Expecting note.Type == 'TestNoteType'", note:GetType() == "TestNoteType", true)
end

for _, case in pairs(TestCase) do
	print(_ .. ':')
	if type(case) == "function" then
	case()
	end
	print('========================')	
end