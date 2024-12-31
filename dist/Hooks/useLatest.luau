-------------------------------------------------------------

local React = require(script.Parent.Parent:WaitForChild('Packages'):WaitForChild('react'))
-------------------------------------------------------------


export type Predicate<T> = (previous: T | nil, current: T) -> boolean

-------------------------------------------------------------

local isStrictEqual = function(a, b)
	return a == b
end

-------------------------------------------------------------

--[[
	useLatest

	This hook returns a ref object that contains the latest value of a given value. 
	It is useful for comparing the previous value of a prop or state to the current value.

	@author NodeSupport
--]]

local function useLatest<T>(value: T, predicate: Predicate<T> | nil)
	if predicate == nil then
		predicate = isStrictEqual
	end

	local ref = React.useRef(value)

	React.useMemo(function()
		if not (predicate :: Predicate<T>)(ref.current, value) then
			ref.current = value
		end
	end, { value })

	return ref
end

-------------------------------------------------------------

return useLatest
