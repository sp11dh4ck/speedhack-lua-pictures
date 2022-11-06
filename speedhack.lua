-- Further reading:
-- https://lua.neverlose.cc/documentation/variables/ui
-----------------------------------------------------------------
-- Добавить AA, визуалы из onetap v3, добавить в нл onetap v3 the best cheat,
-- killsay (блявотина), аксессуары из samp на перса, невидимость, бесмертие, полёт, роллы/суши/моцарела на дом,

_DEBUG = true


-- Icons --
local icon_home = ui.get_icon("door-open")
local icon_settings = ui.get_icon("cogs")
local icon_aa = ui.get_icon("street-view")
local icon_welcome = ui.get_icon("cat")
local icon_copy = ui.get_icon("upload")
local icon_enter = ui.get_icon("download")
local icon_link_discord = ui.get_icon("comment")
local icon_config = ui.get_icon("wrench")
local icon_smiley = ui.get_icon("smile-wink")
local icon_rage = ui.get_icon("robot")
local icon_my_products = ui.get_icon("list")
local icon_misc = ui.get_icon("tools")
local icon_default = ui.get_icon("sliders-h")
local icon_youtube = ui.get_icon("child")
local icon_menu = ui.get_icon("window-restore")
local icon_commend = ui.get_icon("thumbs-up")
-----------------------------------------------------------------

-- Libraries --
-- local clipboard = require("neverlose/clipboard")
local gradient = require("neverlose/gradient")
-----------------------------------------------------------------

-- Local variables --
local gradient_lua_name = gradient.text("speedhack.lua", false, {
    color(147, 41, 233),
    color(247, 41, 233),
})
local gradient_username = gradient.text(common.get_username(), false, {
    color(147, 41, 233),
    color(247, 41, 233),
})
local gradient_last_update = gradient.text("6.11.22 12:29", false, {
    color(147, 41, 233),
    color(247, 41, 233),
})
local gradient_build = gradient.text("Close beta", false, {
    color(147, 41, 233),
    color(247, 41, 233),
})
local gradient_thank = gradient.text("Thank for using my script!", false, {
    color(147, 41, 233),
    color(247, 41, 233),
})
local gradient_script_name = gradient.text("speedhack", false, {
    color(147, 41, 233),
    color(247, 41, 233),
})
-----------------------------------------------------------------

ui.sidebar(gradient_script_name, "skull")
-- toilet-paper

-- Functions --
--
-----------------------------------------------------------------

-- First tab --
local tab_home_wel = ui.create(icon_home.." Home", icon_welcome.." Welcome", 1)

files.create_folder("nl\\sp1edh4ck")

local function download_content(link, file)
    local download_header = network.get(link, {})
    local is_content = files.write("nl\\sp1edh4ck\\"..file, download_header, true)
    return is_content
end

local function is_downloaded(file)
    local is_there = files.read("nl\\sp1edh4ck\\"..file)
    return is_there
end

if is_downloaded("speedhack.png") == nil then
    download_content("[MEDIA=githubusercontent]sp11dh4ck/speedhack.lua/main[/MEDIA]", "sp1edh4ck.png")
end

local picture_link = network.get("https://raw.githubusercontent.com/sp11dh4ck/speedhack.lua/main/speedhack.png")
local picture = render.load_image(picture_link, vector(270, 270))
tab_home_wel:texture(picture)

local welcome_mess = tab_home_wel:label("Welcome back, "..gradient_username)
local welcome_mess = tab_home_wel:label("Last update: "..gradient_last_update)
local welcome_mess = tab_home_wel:label("Build: "..gradient_build)
local welcome_mess = tab_home_wel:label("Description: "..gradient_thank)
local join_discord = tab_home_wel:button(icon_link_discord.."  Join Discord Server", function() panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/HH8bCVsyTf") end)
local neverlose_cfgs = tab_home_wel:button(icon_my_products.."  All My Products", function() panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/?search=author%3ASp1edH4ck&type=0") end)
local youtube_channel = tab_home_wel:button(icon_youtube.."      My YouTube    ", function() panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/channel/UCbItDwnxqhAkCHdwYPvRtXg") end)
local menu_style = tab_home_wel:button(icon_menu.."       My Menu Style    ", function() panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/getitem?c=RVAXcUgVlcHeQ20q-QxHprS89kQ") end)
local menu_style = tab_home_wel:button(icon_commend.."             Leave Feedback To The Script           ", function() panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=VKYjFE") end)
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local tab_home_cfg = ui.create(icon_home.." Home", icon_config.." Config", 2)

local welcome_mess = tab_home_cfg:label("In the discord you can describe your problem with the script, take the configs of other users, or just chat "..icon_smiley)
local default_cfg_button = tab_home_cfg:button(icon_default.."                         My Cfg Settings                         ")
local copy_cfg_button = tab_home_cfg:button(icon_copy.."   Copy Cfg Code   ")
local enter_cfg_button = tab_home_cfg:button(icon_enter.."   Enter Cfg Code   ")
-----------------------------------------------------------------

-- Second tab --
-- local tab_aa = ui.create(icon_aa.." Anti-Aim", "")
-- local switch_group_ref = tab_aa:switch("Lalalend", false)
-----------------------------------------------------------------

-- Third tab --
local tab_settings_misc = ui.create(icon_settings.." Settings", icon_misc.." Misc", 1)

-- Viewmodel --
local viewmodel_switch = tab_settings_misc:switch("Viewmodel", true)

local viewmodel = viewmodel_switch:create()
local viewmodel_fov = viewmodel:slider("FOV", -100, 100, 75)
local viewmodel_x = viewmodel:slider("X", -15, 15, 3)
local viewmodel_y = viewmodel:slider("Y", -15, 15, 1)
local viewmodel_z = viewmodel:slider("Z", -15, 15, -2)

events.createmove:set(function()
    if viewmodel_switch:get() then
        cvar.viewmodel_fov:int(viewmodel_fov:get(), true)
		cvar.viewmodel_offset_x:float(viewmodel_x:get(), true)
		cvar.viewmodel_offset_y:float(viewmodel_y:get(), true)
		cvar.viewmodel_offset_z:float(viewmodel_z:get(), true)
    else
        cvar.viewmodel_fov:int(68)
        cvar.viewmodel_offset_x:float(2)
        cvar.viewmodel_offset_y:float(0)
        cvar.viewmodel_offset_z:float(0)
    end
end)

events.shutdown:set(function()
    cvar.viewmodel_fov:int(68)
    cvar.viewmodel_offset_x:float(2)
    cvar.viewmodel_offset_y:float(0)
    cvar.viewmodel_offset_z:float(0)
end)
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Trashtalk --
local trashtalk_switch_on = tab_settings_misc:switch("Trashtalk", false)
local trashtalk_settings = trashtalk_switch_on:create()
local trashtalk_type = trashtalk_settings:combo("Message type", "Trashtalk", "Script link")

local trashtalk_on
local trashtype

local trashtalk_phrases = {
    "NN",
    "1",
    "Ты в этой жизни мало, что понимаешь, да и не поймёшь никогда :)",
    "Переигровочка по мозгу, хд",
    "Чел..., ну чел..."
}

trashtalk_switch_on:set_callback(function(ref)
    trashtalk_on = ref:get()
end)

trashtalk_type:set_callback(function(ref)
	trashtype = ref:get()
end)

events.player_death:set(function(e)
    local player = entity.get_local_player()
    local enemies = entity.get(e.attacker, true)
    local fire = entity.get(e.userid, true)

    if player == enemies and fire ~= player then
		if (type(trashtalk_on) == "boolean" and type(trashtype) == "string") then
			local on = string.format("%s", trashtalk_on)
			local sett = string.format("%s", trashtype, true)
			if (on == "true") then
				if (sett == "Trashtalk") then
                    utils.console_exec(string.format('say "%s"', trashtalk_phrases[math.random(5)]))
				end	
				if (sett == "Script link") then
					utils.console_exec(string.format('say "%s"', "https://neverlose.cc/market/item?id=VKYjFE"))
				end
			end
		end
    end
end)
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Watermark --
-- avatar_settings = tab_settings_misc:switch("Avatar On Screen", true)

-- events.render:set( function()
-- 	local player = entity.get_local_player()
-- 	if not player then return end 
-- 	local screensize = render.screen_size()
-- 	local x = screensize.x / 8
-- 	local y = screensize.y / 4

--     if avatar_settings:get() then 
--         local avatar = player:get_steam_avatar()
--         render.texture(avatar, vector(x, y + 45), vector(35, 35), color())
--     end
-- end)
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Rage --
-- local tab_settings_rage = ui.create(icon_settings.." Settings", icon_rage.." Rage", 2)

-- local rage = tab_settings_rage:switch("Resolver (only bind)", false)
-- local rage = tab_settings_rage:switch("Ideal tick (off DT)", false)
-----------------------------------------------------------------
