-- enas_utility_mod/init.lua

-- Load mod name + path
local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

-- Load settings from mod.conf
local settings = Settings(modpath .. "/mod.conf")
local enable_glowing_nodes = settings:get_bool("enable_glowing_nodes", true)
local enable_chat_greeter = settings:get_bool("enable_chat_greeter", true)
-- Greeter for servers

local greeting_message = "Welcome to the server!" -- fallback default

local file = io.open(modpath .. "/greeting.txt", "r")
if file then
    local content = file:read("*all")
    file:close()
    -- Trim whitespace and ensure it's not empty
    if content and content:match("%S") then
        greeting_message = content
    end
end

if enable_chat_greeter then
    minetest.register_on_joinplayer(
	function(player)
        local name = player:get_player_name()
        minetest.chat_send_player(name, greeting_message)
    end
	)
end
-- Glowing nodes
if enable_glowing_nodes then
    local function is_player_creative(player)
        if not player or not player:is_player() then
            return false
        end
        local name = player:get_player_name()
    -- Works for both singleplayer and per-player creative setting
        return minetest.is_creative_enabled(name)
    end
	minetest.register_node("utilities:glowing_stone", {
		description = "Stone | Light Level 14",
        tiles = {"default_stone.png"},
        is_ground_content = false,
        light_source = 14,
        groups = {cracky = 1, oddly_breakable_by_hand = 1},
        can_dig = function(pos, player)
            return is_player_creative(player)
        end,
    })
	minetest.register_node("utilities:glowing_dirt", {
	    description = "Dirt | Light Level 14",
		tiles = {"default_dirt.png"},
		is_ground_content = false,
		light_source = 14,
		groups = {cracky = 1, oddly_breakable_by_hand = 1},
        can_dig = function(pos, player)
            return is_player_creative(player)
        end,
	})
end
