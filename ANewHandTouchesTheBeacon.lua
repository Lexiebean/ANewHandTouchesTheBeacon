ANewBeacon = {}

ANewBeaconFrame = CreateFrame("Frame")
ANewBeaconFrame:RegisterEvent("BAG_UPDATE")

ANewBeaconFrame:SetScript("OnEvent", function()
	if event == "BAG_UPDATE" then

	local clearVars = {}
        for i=0, 4, 1 do
            local j = GetContainerNumSlots(i)
            for a=1, j, 1 do
                local itemLink = GetContainerItemLink(i,a)
                if itemLink then
                    local _, _, itemID, itemName = string.find(itemLink, "item:(%d+):%d+:%d+:%d+.*%[(.*)%]")
                    itemID = tonumber(itemID)
                    if itemID == 8705 or itemID == 8623 or itemID == 8704 then
                        clearVars[itemID] = true
                        if not ANewBeacon[itemID] then
                            ANewBeacon[itemID] = true
                            DEFAULT_CHAT_FRAME:AddMessage("|cffff0000A NEW HAND TOUCHES THE "..string.upper(itemName))
                            UIErrorsFrame:AddMessage("|cffff0000A NEW HAND TOUCHES THE "..string.upper(itemName))
                            PlaySoundFile("Interface\\AddOns\\ANewHandTouchesTheBeacon\\ANewHandTouchesTheBeacon.mp3")
                        end
                    end
                end
            end
        end
        if not clearVars[8705] then ANewBeacon[8705] = false end
        if not clearVars[8623] then ANewBeacon[8623] = false end
        if not clearVars[8704] then ANewBeacon[8704] = false end
	end
end)
