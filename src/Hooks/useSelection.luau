-------------------------------------------------------------

local React = require("@Packages/react")

-------------------------------------------------------------

local SelectionService = game:GetService("Selection")

-------------------------------------------------------------

local function useSelection()
	local selection, setSelection = React.useState(SelectionService:Get())

	React.useEffect(function()
		local connection = SelectionService.SelectionChanged:Connect(function()
			setSelection(SelectionService:Get())
		end)

		return function()
			connection:Disconnect()
		end
	end)

	return selection
end

-------------------------------------------------------------

return useSelection
