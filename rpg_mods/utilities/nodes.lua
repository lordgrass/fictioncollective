-- utilities/nodes.lua
-- Author: J. Aurandt / Enadasa

local M = {}

-- Helper: check if player is in creative mode
local function is_player_creative(player)
    if not player or not player:is_player() then
        return false
    end
    local name = player:get_player_name()
    return minetest.is_creative_enabled(name)
end

-- Main function: register all glowing nodes
function M.register_glowing_nodes()

    -- Max light level nodes
    minetest.register_node("utilities:glowing_stone_max_lv", {
        description = "Stone | Light Level 14",
        tiles = {"default_stone.png"},
        is_ground_content = false,
        light_source = 14,
        groups = {cracky = 1, oddly_breakable_by_hand = 1},
        can_dig = function(pos, player)
            return is_player_creative(player)
        end,
    })

    minetest.register_node("utilities:glowing_dirt_max_lv", {
        description = "Dirt | Light Level 14",
        tiles = {"default_dirt.png"},
        is_ground_content = false,
        light_source = 14,
        groups = {cracky = 1, oddly_breakable_by_hand = 1},
        can_dig = function(pos, player)
            return is_player_creative(player)
        end,
    })

    -- Light level 7 nodes
    minetest.register_node("utilities:glowing_stone_lv_7", {
        description = "Stone | Light Level 7",
        tiles = {"default_stone.png"},
        is_ground_content = false,
        light_source = 7,
        groups = {cracky = 1, oddly_breakable_by_hand = 1},
        can_dig = function(pos, player)
            return is_player_creative(player)
        end,
    })

    minetest.register_node("utilities:glowing_dirt_lv_7", {
        description = "Dirt | Light Level 7",
        tiles = {"default_dirt.png"},
        is_ground_content = false,
        light_source = 7,
        groups = {cracky = 1, oddly_breakable_by_hand = 1},
        can_dig = function(pos, player)
            return is_player_creative(player)
        end,
    })

    -- Light level 1 nodes
    minetest.register_node("utilities:glowing_stone_lv_2", {
        description = "Stone | Light Level 1",
        tiles = {"default_stone.png"},
        is_ground_content = false,
        light_source = 2,
        groups = {cracky = 1, oddly_breakable_by_hand = 1},
        can_dig = function(pos, player)
            return is_player_creative(player)
        end,
    })

    minetest.register_node("utilities:glowing_dirt_lv_2", {
        description = "Dirt | Light Level 1",
        tiles = {"default_dirt.png"},
        is_ground_content = false,
        light_source = 2,
        groups = {cracky = 1, oddly_breakable_by_hand = 1},
        can_dig = function(pos, player)
            return is_player_creative(player)
        end,
    })
end

return M
