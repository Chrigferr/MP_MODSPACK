--[[
*****************************************
*			Map Labels					*
*	by Hazel (hazel16 @ CivFanatics)	*
*****************************************

]]--
print(":::MAPLABELS::: ML_API_BattleLabels loaded")

--variables
vLastUnitKilledLoc = {x=nil, y=nil}
g.var.LastYearBattleChecked = -4000

--constants
PLAYER_IS_KILLED = false
PLAYER_IS_KILLER = true


--functions

--battles
function NewBattleLabel()
	dprint("NewBattleLabel()")

	local iYear
--	local 
	UnitsKilled = CopyTable(g.UnitsKilled, ONE_TO_MANY)
--	local 
	AllBattles = { }
	local Battle = { }
	local aPlots = { }
	local pGetMedianPlot
	local iGetMedianPlotX
	local iGetMedianPlotY
	local aYears = { }
	local iLastYear
	local sName
	local pPlayer
	local iOpponentID
	local sOpponent
	local sLandmarkName
	local UnitKilled

	--divide UnitsKilled into battles
	dprint("Iterating through UnitsKilled")
	for keyA, _ in pairs(UnitsKilled) do
		UnitA = UnitsKilled[keyA]
		iYearA = UnitA.Year
		for keyB, _ in pairs(UnitsKilled) do
			if (keyA ~= keyB) then
				UnitB = UnitsKilled[keyB]
				iYearB = UnitB.Year
				iYears = math.abs(iYearB - iYearA)
				iDistance = Map.PlotDistance(UnitA.PlotX, UnitA.PlotY, UnitB.PlotX, UnitB.PlotY)
				dprint("iYears: "..iYears.." / "..g.Options.BattleLengthYears.." iDistance: "..iDistance.." / "..g.Options.BattleSpreadPlots)
				if (iYears <= g.Options.BattleLengthYears and iDistance <= g.Options.BattleSpreadPlots) then
					if (not Battle[keyA]) then 
						table.insert(Battle,keyA)
					end
					table.insert(Battle,keyB)
					dprint("Inserting units into battle")
					UnitsKilled[keyB] = nil
				end
			end
		end
		dprint("BattleUnits: "..#Battle.." / "..g.Options.BattleMinUnits)
		if (Battle[keyA] and #Battle >= g.Options.BattleMinUnits) then
			table.insert(AllBattles,Battle)
			dprint("Inserting battle into all battles")
		end
		Battle = { }
		UnitsKilled[keyA] = nil
	end



	dprint("Iterating through AllBattles")
	for keyBattle, _ in pairs(AllBattles) do --iterate through every completed battle
		dprint("keyBattle="..keyBattle)
		for _, i in pairs(AllBattles[keyBattle]) do --iterate through every unit killed in the battle
			dprint("i="..i)
			UnitKilled = g.UnitsKilled[i]
			table.insert(aPlots,Map.GetPlot(UnitKilled.PlotX,UnitKilled.PlotY))
			table.insert(aYears,UnitKilled.Year)
			iOpponentID = UnitKilled.OpponentID
			g.UnitsKilled[i] = nil
		end

		--get x,y for battle label
		iGetMedianPlotX, iGetMedianPlotY = GetMedianPlotXY(aPlots,0,0)
		pGetMedianPlot = Map.GetPlot(iGetMedianPlotX,iGetMedianPlotY)
		dprint(keyBattle.."-GetMedian Plot: "..iGetMedianPlotX..iGetMedianPlotY)
		if (TileIsOccupied(iGetMedianPlotX,iGetMedianPlotY)) then
			iGetMedianPlotY = iGetMedianPlotY - 1 
		end

		--get name of battle
		sLandmarkName = GetNearestLandmarkName(pGetMedianPlot,g.Options.LandmarkSearchRange)
		if (sLandmarkName) then
			sName = (Locale.ConvertTextKey("TXT_KEY_ML_BATTLE_NAME").." "..sLandmarkName)
		else
			sName = Locale.ConvertTextKey("TXT_KEY_ML_BATTLE_NAME_SHORT")
		end
		dprint("---Battle name: "..sName)

		--get year of battle
		sYear = GetYearRangeString(aYears)

		dprint("---Battle years: "..sYear)
						
		--ToolTip
		sToolTip = (GetName(HUMANID).." vs "..GetName(iOpponentID).."[NEWLINE]"..sYear)

		table.insert(g.Labels, {MainType="BATTLE", SubType="BATTLE", Name=sName, ToolTip = sToolTip, PlotX=iGetMedianPlotX, PlotY=iGetMedianPlotY})
				DrawLabel(#g.Labels)
	end

	g.UnitsKilled = UnitsKilled

	g.var.LastYearBattleChecked = Game.GetGameTurnYear()
end


function OnUnitKilledInCombat(iKillerID, iOwnerID, iUnitTypeID) -- add entry to g.UnitsKilled
	dprint("OnUnitKilledInCombat()")

	if g.Options.BattleEnabled == 0 then return; end

	if (not vLastUnitKilledLoc.x or not vLastUnitKilledLoc.y) then 
		dprint("Unit Killed location invalid, cancelling",ERROR)
		return
	end

	local UnitKilled = { }

	iPlayerID = Game.GetActivePlayer()
	if (iKillerID==iPlayerID) then
		UnitKilled["PlayerIsKiller"] = PLAYER_IS_KILLER
		UnitKilled["OpponentID"] = iOwnerID
	elseif (iOwnerID==iPlayerID) then
		UnitKilled["PlayerIsKiller"] = PLAYER_IS_KILLED
		UnitKilled["OpponentID"] = iKillerID
	else --do not record event if iPlayerID not involved
		return
	end

	UnitKilled["Year"] = Game.GetGameTurnYear()
	UnitKilled["PlotX"] = vLastUnitKilledLoc.x
	UnitKilled["PlotY"] = vLastUnitKilledLoc.y

	dprint("Killer or Owner is Player0")
	dprintT(UnitKilled)

	table.insert(g.UnitsKilled, UnitKilled)
		vLastUnitKilledLoc = {x=nil, y=nil}
	bIgnoreOnCanSaveUnit = true
end
GameEvents.UnitKilledInCombat.Add(OnUnitKilledInCombat)

function OnCanSaveUnit(iPlayerID, iUnitID) --fires before and after unitkilledincombat; use it to record location of unit death
	dprint("OnCanSaveUnit()")
	if g.Options.BattleEnabled == 0 then return; end

	local pPlayer = Players[iPlayerID]
	if (pPlayer) then 
		local pUnit = pPlayer:GetUnitByID(iUnitID)
		local pPlot = pUnit:GetPlot()
		vLastUnitKilledLoc = {x=pPlot:GetX(), y=pPlot:GetY()}
		dprint("vLastUnitKilledLoc",vLastUnitKilledLoc.x,vLastUnitKilledLoc.y)
	else
		dprint("No player, cancelling")
	end
end
GameEvents.CanSaveUnit.Add(OnCanSaveUnit)


--razed cities
function OnCityRazed(vHex, iPlayerID, iCityID, iNewPlayerID)
	dprint("OnCityRazed()")

	local iPlayer
	local sCityName
	local x,y = ToGridFromHex(vHex.x,vHex.y)

	if g.Options.RazedEnabled == 0 then return; end

	for i,row in pairs(g.CitiesCaptured) do
		if (row.X==x and row.Y==y) then
			sCityName = row.CityName
			iPlayer = row.iPlayer
		end
	end

	if (not sCityName) then dprint("Razed city not in g.CitiesCaptured",ERROR); return;end
	
	local pPlayer = Players[iPlayer]
	local sYear = GetTurnYearString(Game.GetGameTurnYear())
	
	local sCivName = pPlayer:GetCivilizationAdjective()
	local sName = (Locale.ConvertTextKey("TXT_KEY_ML_RAZED_NAME").." "..sCityName)
	local sToolTip = (sCivName..", "..Locale.ConvertTextKey("TXT_KEY_ML_RAZED_TOOLTIP").." "..sYear)

	table.insert(g.Labels, {MainType="BATTLE", SubType="RAZED", Name=sName, ToolTip = sToolTip, PlotX=x, PlotY=y})
		DrawLabel(#g.Labels)
end
Events.SerialEventCityDestroyed.Add(OnCityRazed)

function OnCityCapture(iPlayerOld, bCapital, x, y, iPlayerNew)
	dprint("OnCityCapture():"..x,y,bCapital,iPlayerOld,iPlayerNew)
	pCity = Map.GetPlot(x,y):GetPlotCity()
	sCityName = pCity:GetName()
	table.insert(g.CitiesCaptured,{X=x,Y=y,CityName=sCityName, iPlayer=iPlayerOld})
end
GameEvents.CityCaptureComplete.Add(OnCityCapture) 