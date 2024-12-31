-------------------------------------------------------------

local RunService = game:GetService("RunService")

-------------------------------------------------------------

local React = require("@Packages/react")
local ReactRoblox = require("@Packages/react-roblox")

-------------------------------------------------------------

local PluginContext = require("@Contexts/PluginContext")

-------------------------------------------------------------

local function RootPluginRoute(props: { plugin: Plugin })
	return React.createElement(PluginContext.Provider, { value = props.plugin }, {})
end

-------------------------------------------------------------

return function(plugin)
	if RunService:IsRunning() then
		return
	end

	local PluginElement = React.createElement(RootPluginRoute, {
		plugin = plugin,
	})

	local Folder = Instance.new("Folder")
	Folder.Name = "__$PluginTemplateName"

	local RootComponent = ReactRoblox.createRoot(Folder)
	RootComponent:render(PluginElement)
end
