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
    local function creative_only_dig(pos, node, digger)
		-- Stops survival mode players from breaking the node.
        if digger and digger:is_player() then
            local name = digger:get_player_name()
            if minetest.is_creative_enabled(name) then
                return minetest.node_dig(pos, node, digger)
            end
        end
    end
	--Registers the nodes
	minetest.register_node("utilities:glowing_stone", {
		description = "Stone | Light Level 14",
        tiles = {"default_stone.png"},
        is_ground_content = false,
        light_source = 14,
        groups = {enas_utilities = 1},
		on_dig = creative_only_dig,
    })
	minetest.register_node("utilities:glowing_dirt", {
	    description = "Dirt | Light Level 14",
		tiles = {"default_dirt.png"},
		is_ground_content = false,
		light_source = 14,
		groups = {enas_utilities = 1},
		on_dig = creative_only_dig,
	})
end
