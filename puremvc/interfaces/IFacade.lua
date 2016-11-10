local class = require 'middleclass.lua'

IFacade = class('IFacade')

-- proxy
function IFacade:RegisterProxy(proxy)
        -- body
end

function IFacade:RetrieveProxy(proxyName)
        -- body
end

function IFacade:RemoveProxy(proxyName)
        -- body
end

function IFacade:HasProxy(proxyName)
        -- body
end

-- Command
function IFacade:RegisterCommand(notificationName, command)
        -- body
end

function IFacade:RemoveCommand(notificationName)
        -- body
end

function IFacade:HasCommand(notificationName)
        -- body
end

-- Mediator
function IFacade:RegisterMediator(mediatorName)
        -- body
end

function IFacade:RetrieveMediator(proxy)
        -- body
end

function IFacade:RemoveMediator(mediatorName)
        -- body
end

function IFacade:HasMediator(mediatorName)
        -- body
end

-- Observer
function IFacade:NotifyObservers(notification)
        -- body
end