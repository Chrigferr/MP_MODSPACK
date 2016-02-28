--[[
*****************************************
*			Map Labels					*
*	by Hazel (hazel16 @ CivFanatics)	*
*****************************************
ML_DynamicLabelsGenerator:	Iterates through map plots, grouping into features
							and regions, assigning cultural names and returning
							labels table in format of g.Labels
]]--

print(":::MAPLABELS::: ML_API_DLG loaded")

StartingPlots = { }
PlotsToLabel = { }
DynamicLabels = { }

MINAREASIZE = 25
NUMLABELNAMELOOPS = 10

iTotalLabels = 0

--plot sorting functions



function GetStartingPlotCultures()
	dprint("GetStartingPlotCultures()")
	StartingPlots = { }

	for _,iPlayer in pairs(MajorCivs()) do
		dprintV();dprintV("Player: "..iPlayer);dprintV()
		local pPlayer = Players[iPlayer]
		local pPlot = pPlayer:GetStartingPlot()
		local bCulture = false
--		local sPlayerCivType = GameInfo["Civilizations"][pPlayer:GetCivilizationType()]["Type"]
		StartingPlots[pPlot] = { }

		for _,sCultureType in pairs(g.CivCultures[iPlayer]) do
			dprintV("sCultureType="..sCultureType)
			table.insert(StartingPlots[pPlot],sCultureType)
			bCulture = true
		end

		if (not bCulture) then
			table.insert(StartingPlots[pPlot],"NOCULTURE")
--			dprint(sPlayerCivType.." has no culture assigned in g.CivCultures; setting culture to NOCULTURE",ERROR)
		end
		dprintTV(StartingPlots[pPlot]);dprintV()
	end
end


function SortPlotsByType()
	dprint("SortPlotsByType()")
--[[	g_Mountain.plots = { }
	g_Lake.plots = { }
	g_River.plots = { }
	g_Forest.plots = { }
	g_Desert.plots = { }
	g_Ocean.plots = { }
	g_Region.plots = { } ]]

	for _, pPlot in Plots(Shuffle) do
		--features
		if (PlotIsMountain(pPlot)) then
			table.insert(g_Mountain.plots,pPlot)
		elseif (PlotIsLake(pPlot)) then
			table.insert(g_Lake.plots,pPlot)
		elseif (PlotIsRiver(pPlot)) then
			table.insert(g_River.plots,pPlot)
		elseif (PlotIsForest(pPlot)) then
			table.insert(g_Forest.plots,pPlot)
		elseif (PlotIsDesert(pPlot)) then
			table.insert(g_Desert.plots,pPlot) 
		end

		--regions
		if (PlotIsWater(pPlot) and (not PlotIsRiver(pPlot)) and (not PlotIsLake(pPlot))) then
			table.insert(g_Ocean.plots,pPlot)
		else
			table.insert(g_Region.plots,pPlot)
		end
	end	
end

function DividePlotsIntoChunks(Feature)
	dprint("DividePlotsIntoChunks()")
	
	local FeatureChunks = { }
	local AdjacentValidPlots = { }

	local ichunkkey = 1
	local bstillhaveplotstoiterate


	for key, pInitialPlot in pairs(Feature.plots) do --for/do/end loop: CREATE CHUNK FOR EACH PLOT IN FEATUREPLOTS
			
		AdjacentValidPlots[pInitialPlot] = NEEDSITERATION --add original plot to AdjacentValidPlots, sets NEEDSITERATION as has not been iterated yet
		bstillhaveplotstoiterate = true

		while (bstillhaveplotstoiterate == true) do
			bstillhaveplotstoiterate = false
			for pPlotToIterate, iterationstate in pairs(AdjacentValidPlots) do
				if (iterationstate == NEEDSITERATION) then
					for pEdgePlot in PlotRingIterator(pPlotToIterate, 1) do --for selected plot, select every edge plot, and do:
						if (not AdjacentValidPlots[pEdgePlot]) then
							if (Feature.f_Verify(pEdgePlot)) then -- if edge plot is same feature, then:
								AdjacentValidPlots[pEdgePlot] = NEEDSITERATION
								bstillhaveplotstoiterate = true
							end
						end
					end
				end
				AdjacentValidPlots[pPlotToIterate] = ITERATIONDONE
			end
		end

		--at this point, should have all plots in chunk in AdjacentValidPlots with value = ITERATIONDONE
		--don't want to end up re-doing the function and make a chunk for every plot already in a chunk, so, will delete them from FeaturePlots
			
		FeatureChunks[ichunkkey] = { }			
		for pPlotInChunk, _ in pairs(AdjacentValidPlots) do
			table.insert(FeatureChunks[ichunkkey],pPlotInChunk)
			for key, pPlotToRemove in pairs(Feature.plots) do
				if (pPlotInChunk == pPlotToRemove) then
					Feature.plots[key] = nil
				end
			end
		end 
		ichunkkey = ichunkkey + 1
		AdjacentValidPlots = { }
	end

	return FeatureChunks;

end

function AreasToChunks(Feature)
	local FeatureChunks = { }
	local ichunkkey = 1

	--for every area in Feature.areas, collect all plots into FeatureChunks[i] = { list of plots }

	if (not Feature.areas) then print("no "..Feature.name.." areas exist"); return; end


	for _, pArea in pairs(Feature.areas) do
		for _, pPlot in Plots(Shuffle) do
			if pPlot:Area() == pArea then
				FeatureChunks[ichunkkey] = { }
				table.insert(FeatureChunks[ichunkkey], pPlot)
			end
		end
		ichunkkey = ichunkkey + 1
	end

	return FeatureChunks
end







function ChunksToGetMedianPlots(Feature)
	dprint("ChunksToGetMedianPlots()")
	local GetMedianPlotsTable = { } --this table should eventually look like GetMedianPlotsTable[pPlot] = # of tiles in chunk
	local PlotsInChunk = { }
	local inumplotsinchunk
	local GetMedianX
	local GetMedianY
	local pGetMedianPlot

	if (#Feature.chunks==0) then dprint("no "..Feature.name.." chunks exist",ERROR); return; end

	dprintV("Iterating through Feature.Chunks for "..Feature.name)
	--Feature.chunks[key] = { list of plots in chunk }
	for key, plotlist in pairs (Feature.chunks) do
		dprintV("chunk# "..key)
		if (#plotlist < g.Options.GlobalMaxPlotsInChunk) then
			local pMedianPlot = Map.GetPlot(GetMedianPlotXY(plotlist,0,1))
			pMedianPlot = GetMedianPlotLoop(pMedianPlot, plotlist)
			if (pMedianPlot) then
				dprintV("Valid median plot found")
				GetMedianPlotsTable[pMedianPlot] = #plotlist
			else
				dprintV("No valid median plot found...cancelling")
			end
		else
			dprintV("too many plots in this chunk...cancelling")
		end
	end

	--debug
	dprintV("Final GetMedianPlotsTable:")
	for pPlot, numplots in pairs(GetMedianPlotsTable) do
		dprintV({pPlot:GetX(), pPlot:GetY(), numplots})
	end
	--Debug_HighlightAllPlots(GetMedianPlotsTable, mountain, TABLETYPE_PLOTPAIRS)

	return GetMedianPlotsTable

end

function GetMedianPlotLoop(pGetMedianPlot, PlotsInChunk)
	dprintV("GetMedianPlotLoop()")
	for pAreaPlot in PlotAreaSpiralIterator(pGetMedianPlot, 15, SECTOR_SOUTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
--		dprintV("pAreaPlot=",pAreaPlot:GetX(), pAreaPlot:GetY())
		for i, pPlot in pairs(PlotsInChunk) do
--			dprintV("pPlot (from PlotsInChunk)=",pPlot:GetX(),pPlot:GetY())
			if (pPlot == pAreaPlot and not TileIsOccupied(pPlot:GetX(),pPlot:GetY())) then
				dprintV("Succeeded: pPlot==pAreaPlot and not TileIsOccupied()")
				return pPlot
			end
		end
	end
	dprintV("Failed to find valid plot")
	return false
end

--[[
function s(a,b)
	return a["NumPlots"]>b["NumPlots"]
end]]

function RemoveIslandsAtMapEdge(tPlots)

	local _, iMapHeight = Map.GetGridSize()
	local iMaxIslandLat = iMapHeight - g.Options.IslandYMargin
	local iMinIslandLat = g.Options.IslandYMargin

	for pPlot,__ in pairs(tPlots) do
		local x,y = GetXY(pPlot)
		local iLat = pPlot:GetY()
		if not (iLat > iMinIslandLat) or not (iLat < iMaxIslandLat) then
			tPlots[pPlot] = nil
		end
	end

	return tPlots
end




function CombineFeatureTables(t)
	for pPlot,numplots in pairs(t.GetMedianplots) do
		row = {Plot=pPlot, NumPlots = numplots, Name=t.name}
		table.insert(g_GetMedianPlots,row)
	end 
end

function SelectPlotsForLabeling(t)
	dprint("SelectPlotsForLabeling()")
	--debug
	--bDebugPrintVerbose = 1


	--REFERENCE: g_GetMedianPlots[i] .Plot, .NumPlots, .Name (featurename)
	--table.sort(g_GetMedianPlots,s)  --works in firetuner but not runtime, why??
	--have to do this manually...
	local t = t or g_GetMedianPlots
	local tCounts = {MOUNTAIN=0,RIVER=0,LAKE=0,FOREST=0,DESERT=0,OCEAN=0,REGION=0,ISLAND=0}
	local s = { }

	for i,row in pairs(g_GetMedianPlots) do
		table.insert(s,row.NumPlots)
	end
	table.sort(s)

	j = 0
	for key,__ in pairs(s) do
		iMax = s[#s-j]
		for i, row in pairs(t) do
			if (row.NumPlots == iMax) then
				dprintV("+++++++++++++++++++++++++++++++++++++")
				local pNewPlot = row.Plot
				local numplots = row.NumPlots
				local sFeature = row.Name
				local SubType = g.SubTypes(sFeature)
				dprintV("Feature: "..row.Name)
				dprintV("Iterating through GetMedianPlots: pNewPlot = ", pNewPlot:GetX(), pNewPlot:GetY(), numplots)
				bNewPlotValid = true

				if (SubType.Enabled ~= 1) then
					bNewPlotValid = false
				end

				dprintV("Minplots: "..SubType.MinPlotsInChunk)
				dprintV("Numplots: "..numplots)
				if (numplots < SubType.MinPlotsInChunk) then
					bNewPlotValid = false
					dprintV("Not enough plots in this chunk to qualify for labeling.")
					--break
				end
		
				dprintV("Minplotdistance: "..SubType.MinPlotDistance)
				for pFeaturePlot, _ in pairs(PlotsToLabel) do
					if PlotsToLabel[pFeaturePlot] == sFeature then
						local iPlotDistance = Map.PlotDistance(pNewPlot:GetX(), pNewPlot:GetY(), pFeaturePlot:GetX(), pFeaturePlot:GetY())
						--dprintV("Distance from next label (same feature): "..iPlotDistance)
						if (iPlotDistance < SubType.MinPlotDistance) then
							bNewPlotValid = false
							dprintV("Too close to another label of same feature to qualify for labeling.")
							--break
						end
					end
				end

				dprintV("Globalminplotdistance: "..g.Options["GlobalMinPlotDistance"])
				for pOldPlot, _ in pairs(PlotsToLabel) do
					local iPlotDistance = Map.PlotDistance(pNewPlot:GetX(), pNewPlot:GetY(), pOldPlot:GetX(), pOldPlot:GetY())
					--dprintV("Distance from next label: "..iPlotDistance)
					if (iPlotDistance < g.Options["GlobalMinPlotDistance"]) then
						bNewPlotValid = false
						dprintV("Too close to another label on map to quality for labeling.")
						--break
					end
				end

				if bNewPlotValid == true then
					PlotsToLabel[pNewPlot] = sFeature
					iTotalLabels = iTotalLabels + 1
					tCounts[sFeature] = tCounts[sFeature] + 1
					dprintV("pNewPlot qualifies for labeling, added to PlotsToLabel.", iPlots)
				else
					dprintV("pNewPlot does NOT qualify...cancelling")
				end

				dprintV("--------------")
				dprintV("Maxchunks: ".. SubType.MaxChunks)
				dprintV("Globalmaxchunks: "..g.Options["GlobalMaxChunks"])
				dprintV("tCounts[sFeature]: "..tCounts[sFeature], "iTotalLabels: "..iTotalLabels)
				if ((tCounts[sFeature] >= SubType.MaxChunks) or (iTotalLabels >= g.Options["GlobalMaxChunks"])) then
					dprintV("Maxchunks reached...cancelling")
					return
				end

				t[i] = nil --don't relabel 
				dprintV("OK, continuing...")
				break
			end
		end
		j=j+1
	end
	
	return

end

function GetCulture(pPlot)
	dprintV("GetCulture()")

	if (g.Options.CultureType == "ONECULTURE") then
		return g.Options.OneCulture
	elseif (g.Options.CultureType == "RANDOM") then
		return "RANDOM"
	else -- NEARESTCIV is default
		local iMinDistance = -1
		local pNearestStartPlot = -1
		for pStartPlot,row in pairs(StartingPlots) do
			local iDistance = PlotDistance(pPlot,pStartPlot).Distance
			if iMinDistance==-1 or iDistance<iMinDistance then
				iMinDistance=iDistance
				pNearestStartPlot = pStartPlot
			end
		end
		if (iMinDistance ~= -1) then
			if #StartingPlots[pNearestStartPlot]>1 then
				local iCulture = math.random(#StartingPlots[pNearestStartPlot])
				return StartingPlots[pNearestStartPlot][iCulture]
			elseif #StartingPlots[pNearestStartPlot]==1 then
				return StartingPlots[pNearestStartPlot][1]
			end
		end
		dprintV("Cannot find a nearby starting plot, setting culture to NOCULTURE.")
		return "NOCULTURE" -- if no starting positions near feature, then name randomly
	end	
end

function GetLabelNames()

	local tBCAF = { } --organize names by culture and feature
	local tBF = { } --by feature only

	for _,row in pairs(CULTURES) do
		tBCAF[row.Type]={ }
	end

	for _,row in pairs(g.SubTypes) do
		for sCulture,_ in pairs(tBCAF) do
			tBCAF[sCulture][row.Type]={}
		end
		tBF[row.Type] = {}
	end


	for row in GameInfo.ML_Labels_Dynamic() do
		if (tBCAF[row.CultureType] and tBCAF[row.CultureType][row.SubType]) then
			table.insert(tBCAF[row.CultureType][row.SubType],row.Name)
		else
			dprint("ML_Labels_Dynamic entry",row.Name,"references Culture or SubType that does not exist",row.CultureType,row.SubType)
		end
		if (tBF[row.SubType]) then
			table.insert(tBF[row.SubType],row.Name)
		else
			dprint("ML_Labels_Dynamic entry",row.Name,"references SubType that does not exist",row.SubType)
		end
	end

	return tBCAF, tBF

end

function AssignLabels()
	dprint("AssignLabels()")
	
	local NamesByCultureAndFeature, NamesByFeature = GetLabelNames()

	for pPlot, sFeature in pairs(PlotsToLabel) do
		dprintV("Plot: ",sFeature,pPlot:GetX(),pPlot:GetY())
		
		local bEnabled = g.SubTypes(sFeature).Enabled
		local sName = nil
		local sCulture=GetCulture(pPlot)

		if (sCulture=="NOCULTURE") then
			dprintV("NOCULTURE")
		elseif (sCulture=="RANDOM") then
			dprintV("Feature="..sFeature.." Culture=RANDOM, choosing name")
			
			if (NamesByFeature[sFeature] and #NamesByFeature[sFeature]>0) then
				dprintV("#NamesByFeature[sFeature]: ".. #NamesByFeature[sFeature])
				local i=0
				while (not sName) do
					local iName=math.random(#NamesByFeature[sFeature])
					if (NamesByFeature[sFeature][iName]~="NONE") then
						sName=Locale.ConvertTextKey(NamesByFeature[sFeature][iName])
						NamesByFeature[sFeature][iName]="NONE" --clear entry so no duplicate names selected; if make nil messes up #/random
					end
					i=i+1
					if (i>=NUMLABELNAMELOOPS) then
						dprint("Unable to find name for "..sFeature,ERROR)
						break --don't allow infinite loop if all names have been taken
					end
				end
			end
		else
			dprintV("Feature="..sFeature.." Culture="..sCulture..", choosing name")

			if (NamesByCultureAndFeature[sCulture][sFeature] and #NamesByCultureAndFeature[sCulture][sFeature]>0) then
				dprintV("#NamesByCultureAndFeature[sCulture][sFeature]= "..#NamesByCultureAndFeature[sCulture][sFeature])
				local i = 0
				while (not sName) do
					local iName=math.random(#NamesByCultureAndFeature[sCulture][sFeature])
					if (NamesByCultureAndFeature[sCulture][sFeature][iName]~="NONE") then
						sName=Locale.ConvertTextKey(NamesByCultureAndFeature[sCulture][sFeature][iName])
						NamesByCultureAndFeature[sCulture][sFeature][iName]="NONE"
					end
					i=i+1
					if (i>=NUMLABELNAMELOOPS) then
						dprint("Unable to find name for "..sCulture.." "..sFeature,ERROR)
						break
					end
				end
			end
		end


		if (g.Options.CreateUnnamedLabels==1 and (not sName)) then
			dprintV("CreateUnnamedLabels mode enabled, giving generic name")
			--dprintV("(for "..sCulture.." "..sFeature..")")
			sName = (sCulture.." "..sFeature)
		end
		
		if (sName and bEnabled == 1) then
			dprintV("Has name, creating label",sCulture,sFeature)
			local temptable = { }

			temptable.Name = Locale.ConvertTextKey(sName)
			
			temptable.MainType = g.SubTypes(sFeature).MainType

			temptable.SubType = sFeature
			temptable.PlotX = pPlot:GetX()
			temptable.PlotY = pPlot:GetY()

			table.insert(DynamicLabels, temptable)
			dprintV("Added name ("..sName..") to DynamicLabels{}")	
		else
			dprint("No valid name found OR feature is disabled, cancelling add label",ERROR)
			dprint("(for "..sCulture.." "..sFeature..")")
		end
		dprintV("++++++++++++++++++++++++++++++")
	end
end


function DynamicLabelsGenerator()
	--iterate through map, divide plots by feature type/ocean/region
	--for each collection of plots by feature, divide into chunks of connected tiles
	--for each chunk, get GetMedian tile and total plots
	--for each feature, select X number of plots for labeling
	--(in this list, order matters: first features will have priority to get a label)
	--assign cultural names to each plot

	StartingPlots = { }
	PlotsToLabel = { }
	DynamicLabels = { }
	g_GetMedianPlots = { }

	iTotalLabels = 0

	MOUNTAIN = "MOUNTAIN"
	RIVER = "RIVER"
	LAKE = "LAKE"
	FOREST = "FOREST"
	DESERT = "DESERT"
	OCEAN = "OCEAN"
	REGION = "REGION"
	ISLAND = "ISLAND"

	g_Mountain = {name=MOUNTAIN, f_Verify=PlotIsMountain}
	g_River = {name=RIVER, f_Verify=PlotIsRiver}
	g_Lake = {name=LAKE, f_Verify=PlotIsLake}
	g_Forest = {name=FOREST, f_Verify=PlotIsForest}
	g_Desert = {name=DESERT, f_Verify=PlotIsDesert}
	g_Ocean = {name=OCEAN, f_Verify=PlotIsWater}
	g_Region = {name=REGION, f_Verify=PlotIsLand}
	g_Island = {name=ISLAND}

	g_Subtypes = {MOUNTAIN,RIVER,LAKE,FOREST,DESERT,OCEAN,REGION,ISLAND}

	g_AllFeatures = {g_Mountain,g_River,g_Lake,g_Forest,g_Desert,g_Ocean,g_Region,g_Island}	

	DynamicLabels = { }

	for _,t in pairs(g_AllFeatures) do
		t.plots = { }
		t.chunks = { }
		t.GetMedianplots = { }
	end


	DLG("Exploring Map")
	SortPlotsByType()

	DLG("Finding Regions and Islands")
	if (g_Region.plots and #g_Region.plots > 0) then
		g_Region.chunks = DividePlotsIntoChunks(g_Region)

		g_Region.GetMedianplots = ChunksToGetMedianPlots(g_Region)
		g_Island.GetMedianplots = { }
		--local temptable = CopyTable(g_Region.GetMedianplots)
		for pPlot,numplots in pairs(g_Region.GetMedianplots) do
			if numplots < tonumber(g.SubTypes("ISLAND").MaxPlotsInChunk) then
				g_Island.GetMedianplots[pPlot]=numplots
				g_Region.GetMedianplots[pPlot]=nil
			end
		end
	end
	
	g_Island.GetMedianplots = RemoveIslandsAtMapEdge(g_Island.GetMedianplots)

	DLG("Finding Oceans")
	if (g_Ocean.plots and #g_Ocean.plots > 0) then
		g_Ocean.chunks = DividePlotsIntoChunks(g_Ocean)

		g_Ocean.GetMedianplots = ChunksToGetMedianPlots(g_Ocean)
	end

	DLG("Finding Mountain Ranges")
	if (g_Mountain.plots and #g_Mountain.plots > 0) then
		g_Mountain.chunks = DividePlotsIntoChunks(g_Mountain)

		g_Mountain.GetMedianplots = ChunksToGetMedianPlots(g_Mountain)

	end

	DLG("Finding Lakes")
	if (g_Lake.plots and #g_Lake.plots > 0) then
		g_Lake.chunks = DividePlotsIntoChunks(g_Lake)

		g_Lake.GetMedianplots = ChunksToGetMedianPlots(g_Lake)

	end
	
	DLG("Finding Rivers")
	if (g_River.plots and #g_River.plots > 0) then
		g_River.chunks = DividePlotsIntoChunks(g_River)
		g_River.GetMedianplots = ChunksToGetMedianPlots(g_River)

	end

	DLG("Finding Forests")
	if (g_Forest.plots and #g_Forest.plots > 0) then
		g_Forest.chunks = DividePlotsIntoChunks(g_Forest)
		g_Forest.GetMedianplots = ChunksToGetMedianPlots(g_Forest)
	
	end
	
	DLG("Finding Deserts")
	if (g_Desert.plots and #g_Desert.plots > 0) then
		g_Desert.chunks = DividePlotsIntoChunks(g_Desert)
		g_Desert.GetMedianplots = ChunksToGetMedianPlots(g_Desert)
		
	end
	
	DLG("Combining Features")
	for i,FeatureTable in pairs(g_AllFeatures) do
		CombineFeatureTables(FeatureTable)
	end

	DLG("Selecting Plots to Label")
	SelectPlotsForLabeling()

	DLG("Getting Civ Cultures")
	GetStartingPlotCultures()

	DLG("Generating Label Names")
	AssignLabels()

	dprintTV(DynamicLabels)
	return DynamicLabels
end





