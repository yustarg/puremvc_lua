passert = {}

passert.equal = function(msg, act, exp)
	if act == exp then		
		print('OK :' .. msg)
	else
		print('Error:' .. msg .. ', the act is ' .. tostring(act))
	end
end

passert.equalNil = function(msg, act)
	if act == nil then
		print('OK :' .. msg)
	else
		print('Error:' .. msg .. ', the act is ' .. tostring(act))
	end
end

passert.equalNotNil = function(msg, act)
	if act ~= nil then
		print('OK :' .. msg)
	else
		print('Error:' .. msg .. ', the act is nil')
	end
end