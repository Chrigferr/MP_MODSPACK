--[[
*****************************************
*			Map Labels					*
*	by Hazel (hazel16 @ CivFanatics)	*
*****************************************

ML_Labels:	Creates and displays labels on map

]]--


print(":::MAPLABELS::: ML_LIB_MapLabelFunctions loaded")

--UI functions
function CorrectStyle(sStyle, sFont) -- for certain font sizes (14,18,22), shadow and stroke styles are switched!
	dprintV("CorrectStyle()")
	if (sFont == "TwCenMT14" or sFont == "TwCenMT18" or sFont == "TwCenMT22") then
		if (sStyle == "Shadow") then
			return "Stroke"
		elseif (sStyle == "Stroke") then
			return "Shadow"
		end
	end
	return sStyle
end

function GetBoxSize(control)
	local iBoxWidth = (control:GetSizeX()+(g.Options.BoxCushion * 2))
	local iBoxHeight = (control:GetSizeY()+(g.Options.BoxCushion * 2))
	return iBoxWidth, iBoxHeight
end

function GetIcon(t) --t can be MapLabel or i (from g.Labels[i])
	local MapLabel
	if type(t)=="table" then
		MapLabel = t
	else
		MapLabel = g.Labels[t]
	end
	if MapLabel.Icon then
		return MapLabel.Icon
	else
		return g.SubTypes(MapLabel.SubType).Icon
	end
end

function GetIconNum(s) -- s = icon string (e.g. [ICON_ML_RAZED])
	for i,sIcon in pairs(ICONS_TABLE) do
		if sIcon == s then
			return i
		end
	end
end


function SetNumOptionFromEditBox(sOption, c)
	local sText = c:GetText()
	if string.len(sText) >= 1 then
		g.Options[sOption] = tonumber(sText)
	end
end
	
function GetColor(MainType,sLabelComponent)
	R = MainType[(sLabelComponent.."_R")]
	G = MainType[(sLabelComponent.."_G")]
	B = MainType[(sLabelComponent.."_B")]
	A = MainType[(sLabelComponent.."_A")]
	return {x=R,y=G,z=B,w=A}
end


--Table functions
function GetKeyFromType(t,sType)
	for i,row in pairs(t) do
		if row.Type == sType then
			return i
		end
	end
	dprint("GetKeyFromType() No corresponding key found",ERROR)
	return false
end

function SortByName(a,b)
	if (a and b) then
		return a["Name"] < b["Name"]
	else
		return false
	end
end

function GetStringFromOptions(tTable,sOptionsType)
	dprint("GetStringFromOptions()")
	dprint("sOptionsType",sOptionsType)
	for i,tOption in pairs(tTable) do
		if tOption.Value == g.Options[sOptionsType] then
			return tOption.String
		end
	end
	dprint("No corresponding value found")
	return nil
end

function GetCivCultures(sEra)
	dprint("GetCivCultures()")
	local CivCultureDB = DBTable{table="ML_CivCultures", type=ONE_TO_MANY}
	g.CivCultures = { } --reset table
	sEra = sEra or "ANCIENT" --default to ancient era cultures

	for _,iPlayer in pairs(MajorCivs()) do
		g.CivCultures[iPlayer] = { }
		local pPlayer = Players[iPlayer]
		local sPlayerCivType = GameInfo["Civilizations"][pPlayer:GetCivilizationType()]["Type"]	
		for _,t in pairs(CivCultureDB) do
			if t.CivType == sPlayerCivType and (t.CultureEra == "ANY" or t.CultureEra == sEra) then
				if (GameInfo["ML_Cultures"][t.CultureType]) then
					table.insert(g.CivCultures[iPlayer],t.CultureType)
				end
			end
		end
	end

end



--Map functions
function TileIsOccupied(x,y)
	dprintV("TileIsOccupied()")
	local pPlot = Map.GetPlot(x,y)
	if LabelAtPlot(x,y) then
		dprintV("label at plot")
		return true
	end
	if pPlot:GetPlotCity() then
		dprintV("city at plot")
		return true
	end
	if (pPlot:GetFeatureType() > -1) then
		dprintV("feature at plot")
		if GameInfo["Features"][pPlot:GetFeatureType()].NaturalWonder == 1 then
			dprintV("feature is natural wonder")
			return true
		end
		dprintV("feature not natural wonder, ok")
	end
	dprintV("not occupied")
	return false
end

function GetNearestLandmarkName(pPlot, iLandmarkSearchRange) --TODO: move to HazelLuaUtils when make g.Labels global
	dprintV("GetNearestLandmarkName()")

	local pCity
--	local sLandmarkName = nil

	for pAreaPlot in PlotAreaSpiralIterator(pPlot, iLandmarkSearchRange, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
		if (pAreaPlot:GetPlotCity()) then --look for city
			pCity = pAreaPlot:GetPlotCity()
			return pCity:GetName()
		elseif ((pAreaPlot:GetFeatureType()~=-1)  and GameInfo["Features"][pAreaPlot:GetFeatureType()].NaturalWonder) then
			return GameInfo[pAreaPlot:GetFeatureType()].Description
		else
			for key, _ in pairs(g.Labels) do
				if (pAreaPlot:GetX() == g.Labels[key].PlotX and pAreaPlot:GetY() == g.Labels[key].PlotY) then
					if (g.Labels[key].MainType == "FEATURE" or g.Labels[key].MainType == "REGION") then
						return g.Labels[key].Name
					end
				end
			end
		end
	end
	return nil
end


--Modder functions
function StringToTxtKey(s)
	s = string.gsub(s, " ", "_")
	s = string.gsub(s,"\'","")
	s = string.gsub(s,"\"","")
	s = string.gsub(s,"-","")
	s = s:upper()
	return s
end

--print XML files into lua log (doesn't appear in firetuner--string too long? but appears in lua.log)
--would not split up string as would cause "[15449.106] MapLabels:" to appear at beginning of lines
--v4: changed double quote escapes to double quotes within single quotes due to user having error: 528: invalid escape sequence near '"'
function LabelsToXML(sTxtKeyPrefix, sLang)

	local tNames = { }
	local sTxtKey = sTxtKey or ""
	sTxtkey = "TXT_KEY_"..sTxtKeyPrefix.."_"
	local sTextLang = "Language_en_US>"
	if (sLang and string.len(sLang)>1) then
		sTextLang = "Language_"..sLang..">"
	end

	local s = '\n*******************************************'
	s = s..('\nPRINTING XML CODE FOR STATIC MAP LABELS.\nCOPY ALL CODE BETWEEN *s TO A NEW XML FILE.')
	s = s..'\n*******************************************'
	s = s..'\n\n<?xml version=\'1.0\' encoding=\'utf-8\'?>'
	s=s..'\n<GameData>\n\t<ML_Labels_Static>'
	
	local t="\n\n\t<"..sTextLang

	for i,row in pairs(g.Labels) do
		local sName = ""
		if (string.len(row.Name)<1) then
			sName = sTxtkey..row.PlotX..row.PlotY
		else
			sName = sTxtkey..StringToTxtKey(row.Name)
		end
		for i,n in pairs(tNames) do --can't have duplicate TXT_KEYs
			if n==sName then
				sName=sName..row.PlotX..row.PlotY	
			end
		end
		table.insert(tNames,sName)
		local sText = row.Name
		s = s..'\n\t\t<Row Name="'..sName..'" PlotX="'..row.PlotX..'" PlotY="'..row.PlotY..'" MainType="'..row.MainType..'" SubType="'..row.SubType..'"'
		if (row.Icon and string.len(row.Icon) > 1) then
			s = s..' Icon="'..row.Icon..'"'
		end
		if (row.ToolTip and string.len(row.ToolTip) > 1) then
			s = s..' ToolTip="'..row.ToolTip..'"'
		end
		s = s..'/>'
		t = t..'\n\t\t<Row Tag="'..sName..'">'
		t = t..'\n\t\t\t<Text>'..sText..'</Text>'
		t = t..'\n\t\t</Row>'
	end
	
	s=s..'\n\t</ML_Labels_Static>'

	t=t..'\n\t</'..sTextLang

	local o = '\n\n\t<ML_Options>'
	--MapType == STATIC
	o = o..'\n\t\t<Update>'
	o = o..'\n\t\t\t<Where>'
	o = o..'\n\t\t\t\t<Type>'..'MapType'..'</Type>'
	o = o..'\n\t\t\t</Where>'
	o = o..'\n\t\t\t<Set>'
	o = o..'<Value>'..'STATIC'..'</Value>'
	o = o..'\n\t\t\t</Set>'
	o = o..'\n\t\t</Update>'
	for sOption, sValue in pairs(g.Options) do
		if string.find(sOption,"Battle") or string.find(sOption,"Razed")	then
			o = o..'\n\t\t<Update>'
			o = o..'\n\t\t\t<Where>'
			o = o..'\n\t\t\t\t<Type>'..sOption..'</Type>'
			o = o..'\n\t\t\t</Where>'
			o = o..'\n\t\t\t<Set>'
			o = o..'\n\t\t\t\t<Value>'..sValue..'</Value>'
			o = o..'\n\t\t\t</Set>'
			o = o..'\n\t\t</Update>'
		end
	end
	o = o..'\n\t</ML_Options>'

	local p ='\n\n\t<ML_LabelMainTypes>'
	for i,mtrow in pairs(g.MainTypes) do
		p = p..'\n\t\t<Update>'
		p = p..'\n\t\t\t<Where>'
			p = p..'\n\t\t\t\t<Type>'..mtrow.Type..'</Type>'
		p = p..'\n\t\t\t</Where>'
		p = p..'\n\t\t\t<Set>'
		for Option,Value in pairs(mtrow) do
			if (Option ~= 'ID' and Option ~= 'Type' and Option ~= 'Description' and Option ~= "String" and Option ~= "StringWithIcon") then 
					p = p..'\n\t\t\t\t<'..Option..'>'..Value..'</'..Option..'>'
			end
		end
		p = p..'\n\t\t\t</Set>'
		p = p..'\n\t\t</Update>'
	end
	p = p..'\n\t</ML_LabelMainTypes>'

	local q ='\n\n\t<ML_LabelSubTypes>'
	for i,strow in pairs(g.SubTypes) do
		q = q..'\n\t\t<Update>'
		q = q..'\n\t\t\t<Where>'
			q = q..'\n\t\t\t\t<Type>'..strow.Type..'</Type>'
		q = q..'\n\t\t\t</Where>'
		q = q..'\n\t\t\t<Set>'
		for Option,Value in pairs(strow) do
			if (Option == 'Icon') then 
				
					q = q..'\n\t\t\t\t<'..Option..'>'..Value..'</'..Option..'>'
				
			end
		end
		q = q..'\n\t\t\t</Set>'
		q = q..'\n\t\t</Update>'
	end
	q = q..'\n\t</ML_LabelSubTypes>'

	local u = '\n</GameData>'
	u = u..'\n\n*******************************************'
	u = u..'\nXML END'
	u = u..'\n*******************************************'

	print(s..t..o..p..q..u)
end


--save functions

function GetModUserData(bState)
	dprintV("GetModUserData()",bState)
	local LOAD
	local SAVE

	if (bState) then
		SAVE = true
	else
		LOAD = true
	end

	--MainTypes Table
	for i,row in pairs(g.MainTypes) do
		local saveprefix = "MainTypes__"..row.Type
		for sOption,Value in pairs(row) do
			if (sOption ~= 'ID' and sOption ~= 'Type' and sOption ~= 'Description') then
				local saverow = saveprefix.."__"..sOption
				if (SAVE and Value) then
					dprintV("Saving:"..saverow.." = "..Value)
					modUserData.SetValue(saverow,Value)
				elseif (LOAD and modUserData.GetValue(saverow)) then
					dprintV("Loading: "..saverow.." = "..modUserData.GetValue(saverow))
					g.MainTypes[i][sOption] = modUserData.GetValue(saverow)
				end
			end
		end
	end

	--SubTypes Table
	for i,row in pairs(g.SubTypes) do
		local saveprefix = "SubTypes__"..row.Type
		for sOption,Value in pairs(row) do
			if (sOption ~= 'ID' and sOption ~= 'Type' and sOption ~= 'Description' and sOption ~= 'MainType' and not string.find(sOption,"String")) then
				local saverow = saveprefix.."__"..sOption
				if (SAVE and Value) then
					dprintV("Saving: "..saverow.." = "..Value)
					modUserData.SetValue(saverow,Value)
				elseif (LOAD and modUserData.GetValue(saverow)) then
					dprintV("Loading: "..saverow.. " = "..modUserData.GetValue(saverow))
					g.SubTypes[i][sOption] = modUserData.GetValue(saverow)
				end
			end
		end
	end
	
	--Options Table
	for sOption,Value in pairs(g.Options) do
		local saveprefix = "Options"
		if (string.find(sOption,"Battle") or string.find(sOption,"Razed") or string.find(sOption,"Global") or string.find(sOption,"Culture")) then
			local saverow = saveprefix.."__"..sOption
			if (SAVE and Value) then
				dprintV("Saving: "..saverow.." = "..Value)
				modUserData.SetValue(saverow,Value)
			elseif (LOAD and modUserData.GetValue(saverow)) then
				dprintV("Loading: "..saverow.. " = "..modUserData.GetValue(saverow))
				g.Options[sOption] = modUserData.GetValue(saverow)
			end
		end
	end
end

--save global options
function MLSave(s)
	dprint("MLSave()")
	if (s~=SAVESTRING) then return;end
	local SAVE = true

	GetModUserData(SAVE)
	modUserData.SetValue("Saved","TRUE")
end
LuaEvents.GameSaved.Add(MLSave)

--load global options
function MLLoad()
	dprint("MLLoad()")
	local LOAD = false

	if (modUserData.GetValue("Saved")~="TRUE") then
		dprint("MLLoad: No global data saved for this user",ERROR)
		return
	end

	GetModUserData(LOAD)
end

--init
function InitTables()
	dprint("InitTable()")

	CULTURES = DBTable{table="ML_Cultures", type=ONE_TO_MANY}
		table.sort(CULTURES,
			function(a,b)
				astring = Locale.ConvertTextKey(a.Description)
				bstring = Locale.ConvertTextKey(b.Description)
				return astring<bstring
			end)

	CULTUREGROUPS = DBTable({table="ML_CultureGroups", type=ONE_TO_MANY})
		table.sort(CULTUREGROUPS,
			function(a,b)
				astring = Locale.ConvertTextKey(a.Description)
				bstring = Locale.ConvertTextKey(b.Description)
				return astring<bstring
			end)

	DISPLAYTYPES = DBTable{table="ML_LabelDisplayTypes",type=ONE_TO_MANY}
		for i,row in pairs(DISPLAYTYPES) do
			--row.Type = string.gsub(row.Type,"LABELDISPLAY_","")
			row.String = Locale.ConvertTextKey(row.Description)
		end
	FONTTYPES = DBTable{table="ML_LabelFonts",type=ONE_TO_MANY}
		for i,row in pairs(FONTTYPES) do
			row.String = Locale.ConvertTextKey(row.Description)
		end
	STYLETYPES = DBTable{table="ML_LabelFontStyles",type=ONE_TO_MANY}
		for i,row in pairs(STYLETYPES) do
			row.String = Locale.ConvertTextKey(row.Description)
		end

	g.Options = DBTable{table="ML_Options", rowtitle="Type", rowvalue="Value",type=ONE_TO_ONE}

	g.MainTypes = DBTable{table="ML_LabelMainTypes",type=ONE_TO_MANY}
	for i,row in pairs(g.MainTypes) do
		if (type(row.Description)=="string" and string.len(row.Description)>1) then
			row.String = Locale.ConvertTextKey(row.Description)
		else
			row.String = row.Type
		end
		row.StringWithIcon = row.Icon.." "..row.String
	end
	g.SubTypes = DBTable{table="ML_LabelSubTypes",type=ONE_TO_MANY}
	for i,row in pairs(g.SubTypes) do
		if (type(row.Description)=="string" and string.len(row.Description)>1) then
			row.String = Locale.ConvertTextKey(row.Description)
		else
			row.String = row.Type
		end
		row.StringWithIcon = row.Icon.." "..row.String
	end

	g.var.LastYearBattleChecked = Game.GetGameTurnYear()

	--icons table
	ICONS_TABLE = { }
	local tempIcons = DBTable{table="IconFontMapping", type=ONE_TO_MANY_NEWKEY}
	local IconTextures =  DBTable{table="ML_IconFontTextures", rowvalue="IconFontTexture",  type=ONE_TO_ONE_NEWKEY}
	table.insert(tempIcons,{IconName="BLANK"})
	local j = #tempIcons
	for i, row in pairs(tempIcons) do --display icons in reverse order (custom icons first)
		if row.IconName=="BLANK" then
			ICONS_TABLE[j] = "BLANK"
		else
			for _,sFontTexture in pairs(IconTextures) do --only display icons from font textures in table ML_IconFontTextures
				if (row.IconFontTexture == sFontTexture) then
					ICONS_TABLE[j] = ("["..row.IconName.."]")
				end
			end
		end
		j = j-1
	end
	iNumIcons = #ICONS_TABLE
	dprint("iNumIcons="..iNumIcons)


end