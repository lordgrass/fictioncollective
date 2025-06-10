-- Unknown, for now
local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

-- Read the setting from mod.conf
local settings = Settings(modpath .. "/mod.conf")
local enabled = settings:get_bool("enabled", false) -- Default to false if not set

-- Function to greet the player on join, only if enabled
if enabled then
    minetest.register_on_joinplayer(function(player)
        local player_name = player:get_player_name()
        minetest.chat_send_player(player_name, "Welcome to the server, " .. player_name .. "!")
    end)
end