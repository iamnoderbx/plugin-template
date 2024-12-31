-------------------------------------------------------------

local React = require("@Packages/react")

-------------------------------------------------------------

local useCallback = React.useCallback
local useRef = React.useRef

-------------------------------------------------------------

local function useLatestCallback(callback)
	local callbackRef = useRef(callback)
	callbackRef.current = callback

	return useCallback(function(...)
		local args = { ... }
		return callbackRef.current(unpack(args))
	end, {})
end

-------------------------------------------------------------

return useLatestCallback
