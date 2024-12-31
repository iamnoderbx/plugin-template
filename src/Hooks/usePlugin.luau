local React = require("@Packages/react")
local PluginContext = require("@Contexts/PluginContext")

local function usePlugin(): Plugin
	return React.useContext(PluginContext)
end

return usePlugin
