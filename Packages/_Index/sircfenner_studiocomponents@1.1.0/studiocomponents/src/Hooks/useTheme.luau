--[=[
	@class useTheme
	
	A hook used internally by components for reading the selected Studio Theme and thereby visually
	theming components appropriately. It is exposed here so that custom components can use this
	API to achieve the same effect. Calling the hook returns a [StudioTheme] instance. For example:

	```lua
	local function MyThemedComponent()
		local theme = useTheme()
		local color = theme:GetColor(
			Enum.StudioStyleGuideColor.ScriptBackground,
			Enum.StudioStyleGuideModifier.Default
		)
		return React.createElement("Frame", {
			BackgroundColor3 = color,
			...
		})
	end
	```
]=]

local Studio = settings().Studio

local React = require(script.Parent.Parent.Parent:FindFirstChild('react'))

local ThemeContext = require(script.Parent.Parent:FindFirstChild('Contexts'):FindFirstChild('ThemeContext'))

local function useTheme()
	local theme = React.useContext(ThemeContext)
	local studioTheme, setStudioTheme = React.useState(Studio.Theme)

	React.useEffect(function()
		if theme then
			return
		end
		local connection = Studio.ThemeChanged:Connect(function()
			setStudioTheme(Studio.Theme)
		end)
		return function()
			connection:Disconnect()
		end
	end, { theme })

	return theme or studioTheme
end

return useTheme
