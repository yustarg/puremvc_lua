require "puremvc/patterns/Observer/Notification"

local class = require "middleclass"

ViewTestNote = class('ViewTestNote', Notification)

ViewTestNote.static.NAME = "ViewTestNote"

function ViewTestNote:initialize(name, body)
  Notification.initialize(self, ViewTestNote.NAME .. name, body)
end

function ViewTestNote.Create(name, body) 
  return ViewTestNote:new(name, body)
end