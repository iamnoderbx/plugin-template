local React = require(script.Parent.Parent:WaitForChild('Packages'):WaitForChild('react'))

local PluginMenuContext: React.Context<Plugin> = React.createContext(nil :: any)
PluginMenuContext.displayName = "PluginReactContext"

return PluginMenuContext
