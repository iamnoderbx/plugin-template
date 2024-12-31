-------------------------------------------------------------

local React = require("@Packages/react")

-------------------------------------------------------------

local useLatest = require("@Hooks/useLatest")

-------------------------------------------------------------

local function useUnmountEffect(callback: () -> nil)
	local callbackRef = useLatest(callback)

	React.useEffect(function()
		return function()
			if callbackRef.current then
				callbackRef.current()
			end
		end
	end, {})
end

-------------------------------------------------------------

return useUnmountEffect
