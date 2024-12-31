local React = require("@Packages/react")

local PluginMenuContext: React.Context<Plugin> = React.createContext(nil :: any)
PluginMenuContext.displayName = "PluginReactContext"

return PluginMenuContext
