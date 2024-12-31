local React = require(script.Parent.Parent:WaitForChild('Packages'):WaitForChild('react'))
local PluginContext = require(script.Parent.Parent:WaitForChild('Contexts'):WaitForChild('PluginContext'))

local function usePlugin(): Plugin
	return React.useContext(PluginContext)
end

return usePlugin
