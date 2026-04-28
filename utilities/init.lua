-- enas_utility_mod/init.lua

-- Load mod name + path
local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

-- Load settings from mod.conf
local settings = Settings(modpath .. "/mod.conf")
local enable_glowing_stone = settings:get_bool("enable_glowing_stone", true) -- default ON

-- Greeter (always active)
minetest.register_on_joinplayer(function(player)
    local player_name = player:get_player_name()
    minetest.chat_send_player(player_name, "Welcome to the server, " .. player_name .. "!")
end)

-- Conditionally register the glowing node
if enable_glowing_stone then
    minetest.register_node("enas_utility_mod:stone", {
        description = "Used for lighting areas where you don't want a torch.",
        tiles = {"default_stone.png"},
        is_ground_content = false,
        light_source = 14,
        groups = {enas_utilities = 1},
    })
end

