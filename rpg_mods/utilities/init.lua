-- utilities/init.lua
--Author: J. Aurandt/Enadasa
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

local nodes = dofile(modpath .. "/nodes.lua")

if enable_glowing_nodes then
    nodes.register_glowing_nodes()
end
