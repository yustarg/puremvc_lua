require "puremvc/patterns/Command/SimpleCommand"
local class = require 'middleclass'

ControllerTestCommand = class("ControllerTestCommand", SimpleCommand)

function ControllerTestCommand:Execute(notification)
  local vo = notification:GetBody()
  vo.result = 2 * vo.input
end