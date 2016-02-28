--[[
*****************************************
*			Map Labels					*
*	by Hazel (hazel16 @ CivFanatics)	*
*****************************************

]]--
print(":::MAPLABELS::: ML_API_ModUtils loaded")


--this function fires after init() complete
--can use to start another mod's init after Map Labels loads
LuaEvents.MapLabels_Loaded.Add(function()
	print("***Map Labels load complete")
end)

--add label --> returns label ID
--[[ t = {		MainType = string
			SubType = string
			Name = localized name
			ToolTip = localized string, optional
			Icon = optional (PLAYER labels only)
			PlotX = x coord
			PlotY = y coord }
	]]--
LuaEvents.MapLabels_AddLabel.Add(function(t)
	dprint("LuaEvents.MapLabels_AddLabel()")

	--verify parameters are valid
	if (not t.MainType or not t.SubType or not t.PlotX or not t.PlotY) then
		dprint("AddLabel: Required parameter missing, needs MainType, SubType, PlotX, PlotY", ERROR)
		t.Added = false
		return
	end
	if not IsInTable{table=g.MainTypes, column="Type", value=t.MainType} then
		dprint("AddLabel: Invalid MainType",ERROR)
		t.Added = false
		return
	end
	if not IsInTable{table=g.SubTypes, column="Type", value=t.SubType, column2="MainType", value2=t.MainType} then
		dprint("AddLabel: Invalid SubType",ERROR)
		t.Added = false
		return
	end
	if not type(t.PlotX) == "number" or not type(t.PlotY) == "number" then
		dprint("AddLabel: Invalid PlotX/PlotY coordinates",ERROR)
		t.Added = false
		return
	end

	table.insert(g.Labels,t)
	local iLabel = #g.Labels
	DrawLabel(iLabel)
	t.ID = iLabel
	t.Added = true
end)

--remove label (label ID)
LuaEvents.MapLabels_RemoveLabel.Add(function(iLabel,t)
	dprint("LuaEvents.MapLabels_RemoveLabel()",iLabel)
	t = t or { }

	if not g.Labels[iLabel] then
		dprint("RemoveLabel: Label "..iLabel.." does not exist",ERROR)
		t.Removed = false
	end

	t.Removed = true
	g.Labels[iLabel] = nil
	RedrawLabels()
end)


LuaEvents.MapLabels_EditLabel.Add(function(iLabel,t)
	dprint("LuaEvents.MapLabels_EditLabel()",iLabel)
	local MapLabel = g.Labels[iLabel]

	if type(t) ~= "table" then
		dprint("EditLabel: No parameters supplied",ERROR)
		t.Edit = false
		return
	end
	if not MapLabel then
		dprint("EditLabel: Label "..iLabel.." does not exist",ERROR)
		t.Edit = false
		return
	end

	g.Labels[iLabel] = { MainType = t.MainType or MapLabel.MainType,
			SubType = t.SubType or MapLabel.SubType,
			Name = t.Name or MapLabel.Name,
			ToolTip = t.ToolTip or MapLabel.ToolTip,
			Icon = t.Icon or MapLabel.Icon,
			PlotX = t.PlotX or MapLabel.PlotX,
			PlotY = t.PlotY or MapLabel.PlotY }

	t.Edit = true
	RedrawLabels()
end)
