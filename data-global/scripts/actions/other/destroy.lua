local scimitarPos = { x = 33205, y = 32537, z = 6 }
local caveEntrancePos = { x = 33206, y = 32536, z = 6 }
local scimitarItemId = 3307
local placedSimitarItemId = 5858
local caveEntranceId = 7181

local function removeEntrance()
	local scimitarItem = Tile(scimitarPos):getItemById(placedSimitarItemId)
	local caveEntranceItem = Tile(caveEntrancePos):getItemById(caveEntranceId)

	if scimitarItem then
		scimitarItem:remove()
	end

	if caveEntranceItem then
		caveEntranceItem:transform(1085)
	end
end

local destroy = Action()

function destroy.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- Tibia tales quest, Aritos task
	if item:getId() == scimitarItemId then
		if toPosition == Position(scimitarPos.x, scimitarPos.y, scimitarPos.z) then
			local scimitarPlaced = Tile(scimitarPos):getItemById(placedSimitarItemId)
			if not scimitarPlaced then
				if player:getStorageValue(Storage.Quest.U8_1.TibiaTales.AritosTask) >= 0 then
					item:remove()
					Game.createItem(placedSimitarItemId, 1, scimitarPos)
					addEvent(removeEntrance, 1 * 60 * 1000)
					return true
				end
			end
		end
	end
	return onDestroyItem(player, item, fromPosition, target, toPosition, isHotkey)
end

local weaponIds = {
	860,
	3264,
	3265,
	3266,
	3267,
	3268,
	3269,
	3270,
	3271,
	3272,
	3273,
	3274,
	3275,
	3276,
	3278,
	3279,
	3280,
	3281,
	3282,
	3283,
	3284,
	3285,
	3286,
	3288,
	3289,
	3290,
	3291,
	3292,
	3294,
	3295,
	3296,
	3297,
	3298,
	3299,
	3300,
	3301,
	3302,
	3305,
	3309,
	3310,
	3311,
	3312,
	3313,
	3314,
	3315,
	3316,
	3317,
	3318,
	3319,
	3320,
	3321,
	3322,
	3323,
	3324,
	3325,
	3326,
	3327,
	3328,
	3329,
	3331,
	3332,
	3333,
	3334,
	3335,
	3336,
	3337,
	3338,
	3339,
	3340,
	3341,
	3342,
	3343,
	3344,
	3346,
	3348,
	6101,
	6528,
	6553,
	7379,
	7380,
	7381,
	7382,
	7383,
	7384,
	7385,
	7386,
	7387,
	7388,
	7389,
	7390,
	7391,
	7392,
	7402,
	7403,
	7404,
	7405,
	7406,
	7407,
	7408,
	7409,
	7410,
	7411,
	7412,
	7413,
	7414,
	7415,
	7416,
	7417,
	7418,
	7419,
	7420,
	7421,
	7422,
	7423,
	7424,
	7425,
	7426,
	7427,
	7428,
	7429,
	7430,
	7431,
	7432,
	7433,
	7434,
	7435,
	7436,
	7437,
	7449,
	7450,
	7451,
	7453,
	7454,
	7455,
	7456,
	7773,
	7774,
	8096,
	8097,
	8098,
	8099,
	8100,
	8101,
	8102,
	8103,
	8104,
	9373,
	9375,
	9376,
	9385,
	9386,
	9387,
	9396,
	10388,
	10389,
	10390,
	10391,
	10392,
	10406,
	11657,
	11692,
	11693,
	12510,
	12673,
	12683,
	12731,
	13987,
	13991,
	14001,
	14040,
	14043,
	14250,
	16160,
	16161,
	16162,
	16175,
	17109,
	17784,
	17812,
	17813,
	17824,
	17828,
	17859,
	20065,
	20066,
	20067,
	20068,
	20069,
	20070,
	20071,
	20072,
	20073,
	20074,
	20075,
	20076,
	20077,
	20078,
	20079,
	20080,
	20081,
	21171,
	21172,
	21173,
	21174,
	21176,
	21177,
	21178,
	21179,
	21180,
	21219,
	22171,
	22172,
	22727,
	22759,
	22760,
	22762,
	27449,
	27450,
	27451,
	27452,
	27453,
	27454,
	27523,
	27525,
	27651,
	28464,
	28723,
	28724,
	28725,
	28829,
	28830,
	28831,
	28832,
	29286,
	29419,
	29421,
	29422,
	30283,
	30395,
	30396,
	30398,
	31580,
	31614,
	32093,
	32616,
	34155,
	34253,
	34254,
	35514,
	43864,
	43865,
	43866,
	43867,
	43868,
	43869,
	43870,
	43871,
	43872,
	43873,
	43874,
	43875,
}

for _, id in ipairs(weaponIds) do
	destroy:id(id)
end

destroy:register()
