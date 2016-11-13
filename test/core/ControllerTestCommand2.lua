require "puremvc/patterns/Command/SimpleCommand"
local class = require 'middleclass'

ControllerTestCommand2 = class("ControllerTestCommand2", SimpleCommand)

function ControllerTestCommand2:Execute(notification)
  local vo = notification:GetBody()
  vo.result = vo.result + (2 * vo.input)
end