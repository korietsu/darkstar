-----------------------------------
-- Area: Dragons Aery
--  HNM: Fafnir
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	killer:addTitle(FAFNIR_SLAYER);
	if(getServerVar("fafnirsToNiddhogg") > 0) then
		respawn = math.random((75600),(86400));
		fafnirsToNiddhogg = getServerVar("fafnirsToNiddhogg");
		setServerVar("[POP]Fafhogg", os.time() + respawn);
		setServerVar("fafnirsToNiddhogg", fafnirsToNiddhogg-1);
		GetMobByID(17408018):setRespawnTime(respawn);
		DeterMob(17408019,true);
	else
		DeterMob(17408018,true)
		DeterMob(17408019,false)
		GetMobByID(17408019):setRespawnTime(respawn);
	end
end;