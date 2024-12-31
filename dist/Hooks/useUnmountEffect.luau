-------------------------------------------------------------

local React = require(script.Parent.Parent:WaitForChild('Packages'):WaitForChild('react'))
-------------------------------------------------------------


local useLatest = require(script.Parent:WaitForChild('useLatest'))
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
