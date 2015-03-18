-----------------------------------
--
-- Zone: Dragons_Aery (154)
--
-----------------------------------
package.loaded["scripts/zones/Dragons_Aery/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/zones/Dragons_Aery/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)

if (getServerVar("[POP]Fafhogg")< os.time()) then
	if(getServerVar("fafnirsToNiddhogg") <= 0) then
		SpawnMob(17408019);
	else
		SpawnMob(17408018);
	end
end
if (getServerVar("[POP]Fafhogg") > os.time() and getServerVar("fafnirsToNiddhogg") > 0 ) then
	GetMobByID(17408018):setRespawnTime(getServerVar("[POP]Fafhogg") - os.time())
else
	GetMobByID(17408019):setRespawnTime(getServerVar("[POP]Fafhogg") - os.time())
end
 

end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
	local cs = -1;	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(-60.006,-2.915,-39.501,202);
	end	
	return cs;	
end;		

-----------------------------------		
-- onConquestUpdate		
-----------------------------------		

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();
    
    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------		
-- onRegionEnter		
-----------------------------------		

function onRegionEnter(player,region)	
end;	

-----------------------------------	
-- onEventUpdate	
-----------------------------------	

function onEventUpdate(player,csid,option)	
	--printf("CSID: %u",csid);
	--printf("RESULT: %u",option);
end;	

-----------------------------------	
-- onEventFinish	
-----------------------------------	

function onEventFinish(player,csid,option)	
	--printf("CSID: %u",csid);
	--printf("RESULT: %u",option);
end;	
