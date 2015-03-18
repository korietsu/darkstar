-----------------------------------
-- Area: Dragons Aery
--  HNM: Nidhogg
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

function onMobFight(mob, target)
    local battletime = mob:getBattleTime();
    local twohourTime = mob:getLocalVar("twohourTime");
    if (twohourTime == 0) then
        mob:setLocalVar("twohourTime",math.random(30,90));
    end
    if (battletime >= twohourTime) then
        mob:useMobAbility(700); 
        -- technically aerial hurricane wing, but I'm using 700 for his two hour 
        --(since I have no inclination to spend millions on a PI to cap one name you never see)
        mob:setLocalVar("twohourTime",battletime + math.random(60,120));
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(NIDHOGG_SLAYER);
	
	respawn = math.random((75600),(86400));
	
	setServerVar("[POP]Fafhogg", os.time()+respawn);
	setServerVar("fafnirsToNiddhogg", math.random(4,6));
	GetMobByID(17408018):setRespawnTime(respawn);
	DeterMob(17408018,false)
	DeterMob(17408019,true)
	
end;