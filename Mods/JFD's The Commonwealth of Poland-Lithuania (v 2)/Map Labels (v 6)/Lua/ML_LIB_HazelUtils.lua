--[[
*****************************************
*			Hazel's Lua Utils			*
*	by Hazel (hazel16 @ CivFanatics)	*
*****************************************

to use, copy following into main lua file:

*****************************************
*****************************************
print(">>>MYMOD: FILENAME loaded")

-----------HazelUtils Defines------------
DEBUGSTRING = ">>>MYMOD: "
SAVESTRING = "MYMODUNIQUESTRING"
bDebug = true
bDebugV = true
-----------------------------------------

--includes
--libraries
include("RouteConnections")
include("TableSaverLoader")
include("PlotIterators")
include("HazelLuaUtils") --must come after HazelUtils defines, as references values

--tables
g = { } --global table, add persistent tables as g.table { }
*****************************************
*****************************************

CONTENTS:
_______________________
____Table Functions____
table types:
	ONE_TO_ONE = 1
	ONE_TO_MANY = 2
	ONE_TO_ONE_NEWKEY = 3
	ONE_TO_MANY_NEWKEY = 4

DBTable(t={table, rowtitle, rowvalue, type(default ONE_TO_MANY), f_title, f_value, f_call})
CopyTable(t={},tabletype)

IsInTable(t={table,value,type,value2,column2,column})

CountRows(t={})

GetGameObjects(t={iPlayer,iUnit,iCity,x,y})



Other handy functions:
From MapmakerUtilities.lua: TestMembership(table, value)

_____________________
___Plot Functions____
(Many of these require PlotIterators)

GetWorldPos(x,y) --> worldpos
GetMedianPlotXY(t={plots},iOffsetX,iOffsetY) --> x,y

PlotIsMountain(pPlot)
PlotIsLake(pPlot)
PlotIsRiver(pPlot)
PlotIsForest(pPlot)
PlotIsDesert(pPlot)
PlotIsLand(pPlot)
IsImprovementNearby(iPlayer,iImprovement,x,y,r,bRequiresOwnership)
IsConnectedByRoad(x1, y1, x2, y2)
UnitInArea(iPlayer,x,y,r,bMilitary,f_Constraint)
UnitOnPlot(iPlayer,x,y,bMilitary,f_Constraint)
OwnedPlotInArea(iPlayer,x,y,r,centerinclude)

AssignPlots(iPlayer,x,y,r,bUnownedOnly)

_____________________
___Game Functions____

MajorCivs() --> table of player IDs of all major civs
GetActivePlayer() --> iPlayer, iTeam
GetYearString(optional y=year) --> string
GetYearRangeString(t={years}) --> string

GetName / GetName.Player(iPlayer) --> civshortdescription
GetName.Unit(pUnit) --> unitname
*Not yet done:GetName.City(iCity)--> cityname

_____________________
____UI Functions_____

MouseBusy()
MouseNormal()

_____________________
___Math Functions____

Round(num, idp=# decimal places, bCeil)
GetMedian(t={numbers}, bCeil)

_______________________
____Print Functions____

dprint(...,optional ERROR) (if bDebug=true or ERROR)
dprintV(...) (if bDebugV=true)
dprintT(t={}) (if bDebug=true)
dprintTV(t={}) (if bDebugV=true)

StringToTxtKey(s=string,p=sPrefix)

_____________________
___Save Functions____
(Require TableSaverLoader)

SaveData()
LoadData()
IsSaveGame()

]]--
print(">>>HazelUtils loaded")

--defines
ONE_TO_ONE = 1
ONE_TO_MANY = 2
ONE_TO_ONE_NEWKEY = 3
ONE_TO_MANY_NEWKEY = 4

DEBUGERROR = DEBUGSTRING.."ERROR "
ERROR = "ERROR"


--Print active mods (from Pazyryk http://forums.civfanatics.com/showpost.php?p=13039852&postcount=4)
print("")
print("****************************************************************")
print("Installed mods:")
local unsortedInstalledMods = Modding.GetInstalledMods()
for key, modInfo in pairs(unsortedInstalledMods) do
	if modInfo.Enabled then
		print("*ENABLED: " .. modInfo.Name .. " (v " .. modInfo.Version .. ") " .. modInfo.ID)
--	else
--		print("Disabled: " .. modInfo.Name .. " (v " .. modInfo.Version .. ") " .. modInfo.ID)	
	end
end
print("****************************************************************")
print("")


--TABLE FUNCTIONS

--DBTable - create new table from database
--call DBTable with parameters: table, rowtitle, rowvalue, type, f_title, f_value, f_call
--can use functions f_title and f_value to transform titles and values
--f_call sets metatable call function (defaults to returning key from 'Type')
--ex. if set up Civilizations table as default ONE_TO_MANY, then Civilizations("CIVILIZATION_AMERICA") returns 0 while Civilizations[0].Type returns "CIVILIZATION_AMERICA"
--types = 
	--ONE_TO_MANY (rowtitle, default database "ID"-->many fields)
	--ONE_TO_MANY_NEWKEY (autoincrement key-->many fields)
	--ONE_TO_ONE (rowtitle, default database "ID"-->rowvalue, default "Type")
	--ONE_TO_ONE_NEWKEY (autoincrement key-->rowvalue, default "Type")
--examples:
	--NewTable = DBTable{table="Flavors"} --> NewTable[ID]=Type
	--NewTable = DBTable{table="Civilizations", type=ONE_TO_MANY} --> NewTable[ID]={Type="x", Description="y" etc}
	--NewTable = DBTable{table="IconFontMapping", rowvalue="IconName", type=ONE_TO_ONE_NEWKEY} --> NewTable[key]=IconName
function DBTable(t)
	--dprintV("DBTable()")
	local TempTable = { }
	local bEmpty = true

	if type(t.table) ~= "string" then dprint("DBTable: No table given, returning empty table",ERROR); return { }; end
	if (not GameInfo[t.table]) then dprint("DBTable: No matching table in database ('"..t.table.."'), returning empty table",ERROR); return { };end
	if (not t.type) then t.type = ONE_TO_MANY; end

	--set up default metatable functions
	if (not t.f_title) then t.f_title = (function(s) return s; end); end
	if (not t.f_value) then t.f_value = (function(s) return s; end); end
	if (not t.f_call) then 
		if (t.type==ONE_TO_MANY or t.type==ONE_TO_MANY_NEWKEY) then
			t.f_call = (function(self,sType)
							for i,row in pairs(self) do 
								if row.Type == sType then
									return self[i]
								end
							end
							dprint("Type not found in table",ERROR)
							return false
						end);
		else --ONE_TO_ONE or ONE_TO_ONE_NEWKEY
			t.f_call = (function(self,sValue)
							for i,Value in pairs(self) do
								if Value==sValue then
									return i
								end
							end
							dprint("Value not found in table",ERROR)
							return false
						end);
		end
	end


	local sTitle = t.rowtitle or "ID"
	local sValue = t.rowvalue or "Type"


	if t.type == ONE_TO_MANY then
		for row in GameInfo[t.table]() do
			if (not row[sTitle]) then dprint("DBTable: ('"..t.table.."') Bad rowtitle "..sTitle, ERROR); return; end
			
			--TempTable[t.f_title(row[sTitle])] = row --don't use this, it will cause permanent link to DB table
			TempTable[row[sTitle]] = { }
			for key,value in pairs(row) do
				TempTable[row[sTitle]][key]=value
			end
			bEmpty = false
		end
	elseif t.type == ONE_TO_MANY_NEWKEY then
		for row in GameInfo[t.table]() do
			table.insert(TempTable,row)
			bEmpty = false
		end
	elseif t.type == ONE_TO_ONE_NEWKEY then
		for row in GameInfo[t.table]() do
			if (row[sValue]) then bEmpty = false; end
			table.insert(TempTable,t.f_value(row[t.rowvalue or "Type"]))
			bEmpty = false
		end
	elseif t.type == ONE_TO_ONE then
		for row in GameInfo[t.table]() do
			if (not row[sTitle]) then dprint("DBTable: ('"..t.table.."') Bad row title "..sTitle, ERROR); return; end
			if (row[sValue]) then bEmpty = false; end
			TempTable[t.f_title(row[sTitle])] = t.f_value(row[sValue])
		end
		
	end
	setmetatable(TempTable,{__call=t.f_call})
	if (bEmpty) then dprint("DBTable: Table ('"..t.table.."') contains 0 rows, returning empty table",ERROR); end
	return TempTable
end

--CopyTable - copy table by creating new table (tNew = t will just assign new pointer to same table)
--types = 
	--ONE_TO_MANY (key-->{})
	--ONE_TO_ONE (key-->value)
function CopyTable(t,tabletype)
	dprintV("CopyTable")
	NewTable = { }
	NewSubTable = { }
	if (tabletype==ONE_TO_MANY) then
		for key1,_ in pairs(t) do
			NewTable[key1] = { }
			NewSubTable = { }
			for key2,value in pairs(t[key1]) do
				NewSubTable[key2] = value
			end
			NewTable[key1] = NewSubTable
		end
	else --ONE_TO_ONE
		for key,value in pairs(t) do
			NewTable[key]=value
		end
	end
	return NewTable
end

--IsInTable - check if value exists in table, returns first found value only
--t = {table,value,type,value2,column2,column}
--if exists, returns true, key (from table[key])
function IsInTable(t)
	--dprintV("IsInTable()")
	if (type(t.table)~="table") then dprint("IsInTable: No table given",ERROR);return false;end
	if (not t.value) then dprint("IsInTable: No test value given",ERROR);return false;end

	t.column2 = t.column2 or "ID"
	t.column = t.column or "Type"

	local results = { }

	for key,value in pairs(t.table) do
		if (type(value)=="table") then
			local row = value
			if (not t.value2 or row[t.column2] == t.value2) then
				if (row[t.column] == t.value) then
					table.insert(results,key)
				end
			end
		else
			if value == t.value then
				table.insert(results,key)
			end
		end
	end

	if #results > 0 then
		if #results > 1 then
			--dprintV("Multiple results found, returning table")
			return true, results
		else
			--dprintV("One result found")
			return true, results[1]
		end
	else
		--dprintV("Value not found")
		return false
	end
end

--CountRows - manually count table rows
--use when #t is not reliable due to changes in indexing
function CountRows(t) 
	dprint("CountRows")
	i=0
	for key,value in pairs(t) do
		i=i+1
	end
	return i
end

--GetGameObjects - return objects from IDs
--t = {iPlayer,iUnit,iCity,x,y)
--returns {Player,Unit,City,Plot}
function GetGameObjects(t)
	local pPlayer = nil
	local pUnit = nil
	local pPlot = nil
	local pCity = nil
	local x = nil
	local y = nil

	if (t.iPlayer) then
		pPlayer = Players[t.iPlayer]
		if (t.iUnit) then
			pUnit = pPlayer:GetUnitByID(t.iUnit)
			if (pUnit) then
				pPlot = pUnit:GetPlot()
				if (pPlot) then
					x = pPlot:GetX()
					y = pPlot:GetY()
				end
			end
		end
		if (t.iCity) then
			pCity = pPlayer:GetCityByID(t.iCity)
			if (pCity) then
				pPlot = pCity:Plot()
			end
		end
	end
	if (t.x and t.y) then
		x = t.x
		y = t.y
		pPlot = Map.GetPlot(x,y)
	end

	return {Player=pPlayer, Unit=pUnit, Plot=pPlot, City=pCity}, x, y	
end

--PLOT FUNCTIONS
function GetXY(pPlot)
	return pPlot:GetX(), pPlot:GetY()
end

function GetWorldPos(xPos,yPos)
	dprintV("GetWorldPos()")
	return HexToWorld(ToHexFromGrid({x=xPos, y=yPos}))
end

function PlotDistance(pPlot1,pPlot2)
	local bAdjacent=false
	local bSamePlot=false
	local iDistance = Map.PlotDistance(pPlot1:GetX(),pPlot1:GetY(),pPlot2:GetX(),pPlot2:GetY())
	if iDistance==1 then bAdjacent=true;end
	if iDistance==0 then bSamePlot=true;end
	return {Distance=iDistance,Adjacent=bAdjacent,SamePlot=bSamePlot}
end

--GetMedianPlotXY -- returns coordinates of middle plot
--tPlots = table set up as t[key]=pPlot
--iOffsetX,iOffsetY optional
function GetMedianPlotXY(tPlots,iOffsetX,iOffsetY)
	dprintV("GetMedianPlotXY()")
	local PlotCoordsX = { }
	local PlotCoordsY = { }

	for key, pPlot in pairs(tPlots) do
		table.insert(PlotCoordsX,pPlot:GetX())
		table.insert(PlotCoordsY,pPlot:GetY())
	end
	
	local x = (GetMedian(PlotCoordsX)+(iOffsetX or 0))
	local y = (GetMedian(PlotCoordsY)+(iOffsetY or 0))
	dprintV({x,y})
	return x,y 
end

function PlotIsMountain(pPlot)
	return pPlot:IsMountain()
end

function PlotIsLake(pPlot)
	return pPlot:IsLake()
end

function PlotIsRiver(pPlot)
	return pPlot:IsNEOfRiver()
end

--incl jungle
function PlotIsForest(pPlot)
	return (pPlot:GetFeatureType() == FeatureTypes.FEATURE_FOREST or pPlot:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE)
end

function PlotIsDesert(pPlot)
	return (pPlot:GetTerrainType() == TerrainTypes.TERRAIN_DESERT)
end

function PlotIsLand(pPlot)
	if pPlot:IsWater() then 
		return false
	else
		return true
	end
end

function PlotIsWater(pPlot)
	return (pPlot:IsWater())
end


function IsImprovementNearby(iPlayer,iImprovement,x,y,r,bRequiresOwnership, bReturnAll)
	local bReturnAll = bReturnAll or false
	local bNearby = false
	local iPlayer = iPlayer or -1
	local improvements = { }
	local pPlot = Map.GetPlot(x,y)
	bRequiresOwnership = bRequiresOwnership or false

	if (iImprovement == -1 or not iImprovement or not GameInfo["Improvements"][iImprovement].Type) then dprint("IsImprovementNearby: No valid improvement; iImprovement=",iImprovement,ERROR);end

	for pEdgePlot in PlotAreaSpiralIterator(pPlot, r, SECTOR_NORTH, DIRECTION_CLOCKWISE) do
		if (pEdgePlot:GetImprovementType()==iImprovement and (not bRequiresOwnership or pEdgePlot:GetOwner()==iPlayer)) then
			bNearby = true
			if bReturnAll then
				table.insert(improvements,{x=pEdgePlot:GetX(),y=pEdgePlot:GetY()})
			else
				return true
			end
		end
    end

	return bNearby, improvements
end

function GetClosestRoad(x,y,r)
	dprintV("GetClosestRoad()")
	local pPlot = Map.GetPlot(x,y)
	local ROAD = GameInfo.Routes.ROUTE_ROAD.ID

	for pEdgePlot in PlotAreaSpiralIterator(pPlot, r, SECTOR_NORTH, DIRECTION_CLOCKWISE) do
		if pEdgePlot:GetRouteType() == ROAD then
			return true,pEdgePlot
		end
	end
	return false
end


function IsConnectedByRoad(x1, y1, x2, y2, PlotsIterated) --PlotsIterated for internal use only, do not provide in call to function
	dprintV("IsConnectedByRoad()")
	local bIsConnected = false
	local pPlot1 = Map.GetPlot(x1,y1)
	local pPlot2 = Map.GetPlot(x2,y2)
	PlotsIterated = PlotsIterated or { }
	--dprintT(PlotsIterated)

	for pEdgePlot in PlotAreaSpiralIterator(pPlot1, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE) do
		if (not PlotsIterated[pEdgePlot] and bIsConnected == false) then
			if (pEdgePlot:GetX() == x2 and pEdgePlot:GetY() == y2) then
				bIsConnected = true
			elseif (pEdgePlot:GetRouteType() ~= -1) then
				PlotsIterated[pEdgePlot] = true
				bIsConnected = IsConnectedByRoad(pEdgePlot:GetX(),pEdgePlot:GetY(),x2,y2,PlotsIterated)
			end
		end
    end

	dprint("bIsConnected: "..tostring(bIsConnected))
	return bIsConnected
end



--UnitInArea    checks whether a player has a unit in area surrounding plot
--returns true/false, pUnit
--optional: bMilitary = true will return only military units (units with combat strength)
--optional: f_Constraint is a function in the form of -- function(pUnit) return true;end -- that will add additional constraints
function UnitInArea(iPlayer,x,y,r,bMilitary,f_Constraint)
	dprintV("UnitInArea()")
	local pPlot = Map.GetPlot(x,y)

	--check center plot
--[[	if (UnitOnPlot(iPlayer,x,y,bMilitary,f_Constraint)) then
		return true
	end]]

	--check surrounding plots (despite CENTRE_INCLUDE does not check center plot)
	for pEdgePlot in PlotAreaSpiralIterator(pPlot, r, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
		if (UnitOnPlot(iPlayer,pEdgePlot:GetX(),pEdgePlot:GetY(),bMilitary,f_Constraint)) then
			return true
		end
	end

	dprintV("No valid unit in area")
	return false
end

function UnitOnPlot(iPlayer,x,y,bMilitary,f_Constraint)
	dprintV("UnitOnPlot()")
	local pPlot = Map.GetPlot(x,y)
	bMilitary = bMilitary or true
	f_Constraint = f_Constraint or (function(pUnit) return true;end)

	for i=0,pPlot:GetNumUnits()-1,1 do
		local pUnit = pPlot:GetUnit(i)
		dprintV("Finding unit "..i.." from plot "..x.."/"..y)
		if (pUnit) then
			dprintV("Unit exists")
			if (pUnit:GetOwner() == iPlayer) then
				dprintV("Passes player check")
				if (not bMilitary or (pUnit:GetBaseCombatStrength() and pUnit:GetBaseCombatStrength()>0)) then
					dprintV("Passes military check")
					if (f_Constraint(pUnit)) then
						dprintV("Passes f_Constraint check")
						dprintV(GetName(iPlayer).." has valid unit in area")
						return true, pUnit
					end
				end
			end
		end
	end

	dprintV("No valid unit on plot")
	return false
end

--TO DO: ADD RETURN VALUE OF WHETHER OWNED BY CITY OR NOT
function OwnedPlotInArea(iPlayer,x,y,r,centerinclude)
	dprintV("OwnedPlotInArea()")
	local pPlayer = Players[iPlayer]
	local pPlot = Map.GetPlot(x,y)
	r = r or 1
	centerinclude = centerinclude or false
	for pEdgePlot in PlotAreaSpiralIterator(pPlot, r, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, centerinclude) do
		if pEdgePlot:GetOwner() == iPlayer then
			dprintV(GetName(iPlayer).." has owned plot in area")
			return true
		end
	end
	return false
end

--AssignPlots    claim center plot and plots around it in radius r
--r = radius, bUnownedOnly = true to avoid claiming plots already assigned to a civ
--if want to claim center plot only, then r=0
function AssignPlots(iPlayer,x,y,r,bUnownedOnly)
	local pPlot = Map.GetPlot(x,y)

	if (r>0) then
		for pEdgePlot in PlotAreaSpiralIterator(pPlot, r, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			if (not bUnownedOnly or pPlot:GetOwner()==-1) then
				pPlot:SetOwner(iPlayer)
			end
		end
	end
end

--! requires "RouteConnections.lua"
--t={ 1={x=x,y=y}, 2=...  }
function GetRouteToClosestPlot(x,y,t,sRoute,f_Constraint)
	dprintV("GetRouteToClosestPlot()")
	local iMinDistance = -1
	local bAnyConnection = false
	local key = -1
	local tPlots = { }
	f_Constraint = f_Constraint or function(...) return false;end
	sRoute = sRoute or "Land"

	if (not type(x)=="number" or not type(y)=="number" or not type(t)=="table") then dprint("GetClosestPlotByRoute called with invalid arguments",ERROR);end

	for i,coord in pairs(t) do
		dprintV("Checking connection between: "..x.."/"..y.." and "..coord.x.."/"..coord.y)
		--make sure first plot and target plot are not the same
		if (x~=coord.x and y~=coord.y) then
			local bConnected, iDistance, tNewPlots = plotToPlotShortestRoute(Players[0],Map.GetPlot(x,y),Map.GetPlot(coord.x,coord.y),sRoute,highlights.Red,f_Constraint)
			dprintV("Connected? ",bConnected,"iDistance=",iDistance)
			if bConnected and (iMinDistance == -1 or iMinDistance>iDistance) then
				dprintV("Connection found, and is best connection so far.")
				iMinDistance = iDistance
				key = i
				bAnyConnection = true
				tPlots = tNewPlots
			end
		end
		dprintV()
	end
	dprintV("     Returning:",bAnyConnection,key,"tPlots")
	return bAnyConnection,key,iMinDistance,tPlots
end

function GetClosestPlayerStart(x,y,t,f_constraint)
	--dprintV("GetClosestPlayerStart()")
	local startingplots = { }

	f_constraint = f_constraint or function(iPlayer) return true; end
	t = t or MajorCivs()

	for _,iPlayer in pairs(t) do
		if (f_constraint(iPlayer)) then
			local pPlayer = Players[iPlayer]
			local pPlot = pPlayer:GetStartingPlot()
			startingplots[iPlayer]={x=pPlot:GetX(), y=pPlot:GetY()}
		end
	end

	local iMinDistance = -1
	local iClosestPlayer = -1
	for iPlayer, coord in pairs(startingplots) do
		local iDistance = Map.PlotDistance(x,y,coord.x,coord.y)
		if (iMinDistance == -1 or iMinDistance>iDistance) then
			iMinDistance = iDistance
			iClosestPlayer = iPlayer
		end
	end

	if (iClosestPlayer == -1) then
		dprint("GetClosestPlayerStart: Could not find closest player",ERROR)
	end
	return iClosestPlayer, iMinDistance
end

--MISC GAME FUNCTIONS

--MajorCivs    returns table of player IDs of all major civs in game
--to iterate table: for _,iPlayer in pairs(MajorCivs()) do...
function MajorCivs()
	local temptable = { }
	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local pPlayer = Players[iPlayer]
		if pPlayer:IsAlive() then	
			table.insert(temptable,iPlayer)
		end
	end
	return temptable
end

--AllCivs    returns table of player IDs of all civs in game (excluding barbs)
--to iterate table: for _,iPlayer in pairs(MajorCivs()) do...
function AllCivs()
	local temptable = { }
	for iPlayer = 0, GameDefines.MAX_PLAYERS-1, 1 do
		local pPlayer = Players[iPlayer]
		if pPlayer:IsAlive() and GetName.Player(iPlayer)~="Barbarians" then	
			table.insert(temptable,iPlayer)
		end
	end
	return temptable
end

--[[
function GetPlayerColor(iPlayer)
	local pPlayer = Players[iPlayer]
	local sPlayerType = pPlayer:GetCivilizationType()

end]]

--ActivePlayer -- returns active player and team IDs
--when called at beginning of game (e.g. Init() function),
--returns human as iPlayer, iTeam
function GetActivePlayer()
	dprintV("GetActivePlayer()")
	local pPlayer = Players[Game.GetActivePlayer()]
	return pPlayer:GetID(), pPlayer:GetTeam() 
end


--GetYearString -- returns string with turn year and AD/BC
--y=year (integer)
--if no argument, uses current year
function GetYearString(y)
	dprintV("GetYearString()")
	local iYear
	
	if (not y) then
		iYear = Game.GetGameTurnYear()
	elseif (type(y)~="number") then
		dprint("ERROR:invalid argument y, need number")
		return
	else
		iYear = y
	end
	
	if (iYear<0) then
		return (math.abs(iYear).." BC")
	else
		return (iYear.." AD")
	end
end

--GetYearRangeString   returns string with "year - year AD/BC"
--t = table of years (t[integerkey starting with 1]=number)
--if know first and last years, then GetYearRangeString({iFirstYear,iLastYear})
function GetYearRangeString(t)
	dprintV("GetYearRangeString()")
	table.sort(t)
	local sYear = ""
	local iLastYear = t[#t]
	local iFirstYear = t[1]
	local sLastYear = GetYearString(iLastYear)
	local sFirstYear = GetYearString(iFirstYear)
	if (iLastYear ~= iFirstYear) then 
		if (iFirstYear < 0 and iLastYear < 0) or (iFirstYear > 0 and iLastYear > 0) then
			--do not duplicate AD/BC
			sYear = math.abs(iFirstYear).." - "..sLastYear
		else
			sYear = sFirstYear.." - "..sLastYear
		end
	else 
		sYear = sFirstYear
	end
	return sYear
end

--GetName

--GetName    returns friendly name
--default is player: GetName(i) is the same as GetName.Player(i)
--invoke others by GetName.Unit(i)...etc
GetName = { }

GetName.Player = function(self,i)
	i = i or self
	if not Players[i] then
		dprint("GetName.Player: Could not find player "..i..", returning empty string",ERROR)
		return ""
	end
	return Players[i]:GetCivilizationShortDescription()
end
setmetatable(GetName,{__call=GetName.Player})

GetName.Unit = function(pUnit)
	if (type(pUnit)=="table") then
		return pUnit:GetName()
	else
		return pUnit
	end
end

GetName.City = function(i)
	return
end




--UI FUNCTIONS
function MouseBusy()
	dprintV("MouseBusy()")
	UIManager:SetUICursor( 1 )
end

function MouseNormal()
	dprintV("MouseNormal()")
	UIManager:SetUICursor( 0 )
end


--MATH FUNCTIONS

--Random (from MODIKI)
function GetRandom(lower, upper)
	return Map.Rand((upper + 1) - lower, "") + lower
end

--Round - rounds "num" to "idp" decimal places
--bCeil (optional) -- true rounds up, false rounds down; default false
function Round(num, idp, bCeil)
	local mult = 10^(idp or 0)
	if (not bCeil) then	
		return math.floor(num * mult + 0.5) / mult
	else
		return math.ceil(num * mult + 0.5) / mult
	end
end

--GetMedian - returns median number from table
--t={1,2,3}
--bCeil (optional) -- true rounds up, false rounds down; default false
function GetMedian(t, bCeil)
    if type(t) ~= 'table' then
		dprint("call to GetMedian without providing table",ERROR)
		return t
	end
    table.sort(t)
    if #t <= 1 then return t[1] end
	if (not bCeil) then
		return t[math.floor(#t/2)]
	else
	    return t[math.ceil(#t/2)]
	end
end


SetMission = { }
function SetMission.MoveToXY(pUnit,x,y)
	dprintV("Mission.MoveTo()")
	pUnit:PopMission()
	pUnit:PushMission(MissionTypes.MISSION_MOVE_TO, x, y, 0, 0, 1)
end

function SetMission.Fortify(pUnit)
	dprintV("Mission.Fortify()")
	--if not already fortified, then cancel current mission
	--(don't want to cancel fortification as # turns fortified are important)
	if pUnit:GetActivityType() ~= ActivityTypes.ACTIVITY_SLEEP then
		pUnit:PopMission()
		pUnit:PushMission(MissionTypes.MISSION_FORTIFY, -1, -1, 0, 0, 1)
	else
		dprintV("Unit already fortified (ACTIVITY_SLEEP)")
	end
	--don't let unit be assigned another mission this turn
	pUnit:FinishMoves()
end

--PRINT FUNCTIONS
--dprint    prints to lua console if debug mode active (bDebug == true)
--last parameter can be TRUE/FALSE (TRUE if error message)
function dprint(...)
	local s = ""
	local bError = false
	local iTotalArgs= -1
	local iNumArgs = select("#",...)

	if iNumArgs==0 and bDebug then --if no arguments given then print horizontal line
		print("------------------------------------------")
		return
	end

	local lastArg = select(iNumArgs,...) --if last argument is true/false, bError = last argument
	if (lastArg==ERROR) then
		bError=true
		iTotalArgs = iNumArgs-1
	else
		iTotalArgs = iNumArgs
	end
	
	if (not bError and not bDebug) then return;end --do not print if not debug or error
	
	if (bError) then --set up string prefix
		s = DEBUGERROR
	else
		s = DEBUGSTRING
	end

	for i=1,iTotalArgs,1 do --create string to print
			s = s..tostring(select(i,...)).."   "
	end
	print(s)
end

--dprint    prints to lua console if verbose debug mode active (bDebugV == true)
function dprintV(...)
	if (not bDebugV) then return;end
	dprint(...)
end

function dprintT(t, iIndent, Done, bEmpty)
	if (not bDebug) then return;end

	iIndent = iIndent or 5
	local s = string.rep(" ", iIndent)
	
	if type(t) == "table" then
		if (not iIndent) then print(DEBUGSTRING..(t.string or "Table")); end
		bEmpty = bEmpty or true
		Done = Done or {}

		for key, value in pairs(t) do
			bEmpty = false
			if type(value) == "table" then
				if value.GetX then
					print(s.."Plot: "..value:GetX()..","..value:GetY())
				elseif not Done[value] then
					Done[value] = true
					print(s..tostring(key)..":")
					dprintT(value, iIndent + 2, Done, bEmpty)
				end
			else
				print(s..tostring(key).."="..tostring(value))
			end
		end
		
		if (bEmpty) then
			dprint(s.."*empty*")
		end
	else
		dprint("No table provided, input contains: ",t,ERROR)
	end
end

function dprintTV(t)
	if (not bDebugV) then return;end
	dprintT(t)
end


--StringToTxtKey -- returns string formatted as TXT_KEY
--s=string, p=prefix
--removes spaces, commas, single/double quotes and dashes
--capitalizes and adds "TXT_KEY" and (optional) user supplied prefix
function StringToTxtKey(s,p)
	dprint("StringToTxtKey")
	local sPrefix
	if (type(s)~="string" or not s) then dprint("ERROR:invalid argument s, need string"); return; end
	if (type(p)=="string") then
		sPrefix = p.."_"
	else
		sPrefix = ""
	end
	s = string.gsub(s, ",", "_")
	s = string.gsub(s, " ", "_")
	s = string.gsub(s,"\'","")
	s = string.gsub(s,"\"","")
	s = string.gsub(s,"-","")
	s = s:upper()
	s = "TXT_KEY_"..sPrefix..s
	return s
end

--DEBUG FUNCTIONS

--Highlight(x,y)
--x,y can be coordinates
--or x can be Plot
function Highlight(x,y,vColor)
	local x1, y1 = 0,0

	if (type(x)~="number") then
		x1 = x:GetX()
		y1 = x:GetY()
	else
		x1 = x
		y1 = y
	end	

	local vHex = ToHexFromGrid(Vector2(x1,y1))
	local vColor = vColor or Vector4(1,0,0,1)

--	local sStyle = "MovementRangeBorder"
	Events.SerialEventHexHighlight(vHex,true,vColor)
end

--HighlightTable(t)
--t can be t = {row={x=x,y=y},...} or t={Plot,...}
function HighlightTable(t,vColor)
	for _,row in pairs(t) do
		if (row.x and type(row.x)=="number") then
			Highlight(row.x,row.y,vColor)
		else
			Highlight(row,nil,vColor)
		end
	end
end


function HighlightAllTables(tTables)
	local iColor = 0
	local vColor = -1
	for _,t in pairs(tTables) do
		vColor,iColor = RotateColors(iColor)
		HighlightTable(t,vColor)
	end
end

function ClearHighlights()
	Events.ClearHexHighlights()
end

--with an increasing i will create up to 32 rainbow colors
function RotateColors(i) 
	local iFreq = 0.3
	r=math.sin(iFreq*i+0)*0.5+0.5
	g=math.sin(iFreq*i+2)*0.5+0.5
	b=math.sin(iFreq*i+4)*0.5+0.5
	if i<32 then
		i=i+3
	else
		i=0
	end
	return Vector4(r,g,b,1),i
end

--SAVE UTILS  (for use with TableSaverLoader.lua)
function SaveData()
	if (SAVESTRING and type(SAVESTRING)=="string" and string.len(SAVESTRING)>1) then
		TableSave(g, SAVESTRING)
		LuaEvents.GameSaved(SAVESTRING)
	end
end

function LoadData()
	TableLoad(g, SAVESTRING)
end

function IsSaveGame()
	local sQuery = "SELECT name FROM sqlite_master WHERE name='"..SAVESTRING.."_Info'"
	local bSaveGame = false
	local DBQuery = Modding.OpenSaveData().Query
	for row in DBQuery(sQuery) do
		bSaveGame = true	-- presence of SAVESTRING tells us that game already in session
	end
	return bSaveGame
end