-------------------------------------------------------------

local React = require(script.Parent.Parent.Parent:WaitForChild('Packages'):WaitForChild('react'))
local usePlugin = require(script.Parent.Parent.Parent:WaitForChild('Hooks'):WaitForChild('usePlugin'))
-------------------------------------------------------------


local function GlobalMapRoute()
	local plugin = usePlugin()
	print(plugin:GetMouse())

	return React.createElement(React.Fragment)
end

return GlobalMapRoute
