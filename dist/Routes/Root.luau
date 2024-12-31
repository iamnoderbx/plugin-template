-------------------------------------------------------------

local RunService = game:GetService("RunService")

-------------------------------------------------------------

local React = require(script.Parent.Parent:WaitForChild('Packages'):WaitForChild('react'))
local ReactRoblox = require(script.Parent.Parent:WaitForChild('Packages'):WaitForChild('react-roblox'))
-------------------------------------------------------------


local PluginContext = require(script.Parent.Parent:WaitForChild('Contexts'):WaitForChild('PluginContext'))
local GlobalMapRoute = require(script.Parent:WaitForChild('Map'):WaitForChild('GlobalMapRoute'))
-------------------------------------------------------------


local function RootPluginRoute(props: { plugin: Plugin })
	return React.createElement(PluginContext.Provider, { value = props.plugin }, {
		GlobalMapRoute = React.createElement(GlobalMapRoute),
	})
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
