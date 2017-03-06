
--[[

     Multicolor Awesome WM theme 2.0
     github.com/copycat-killer

--]]


local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local io    = require("io")
local os    = { getenv = os.getenv, setlocale = os.setlocale }

function capture(cmd)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  return s
end

local theme                                     = {}
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/multicolor"
theme.wallpaper                                 = theme.confdir .. "/wall.png"
theme.font                                      = "xos4 Terminus 12"
theme.menu_bg_normal                            = "#000000"
theme.menu_bg_focus                             = "#000000"
theme.bg_normal                                 = "#000000"
theme.bg_focus                                  = "#000000"
theme.bg_urgent                                 = "#000000"
theme.fg_normal                                 = "#aaaaaa"
theme.fg_focus                                  = "#ff8c00"
theme.fg_urgent                                 = "#af1d18"
theme.fg_minimize                               = "#ffffff"
theme.border_width                              = 1
theme.border_normal                             = "#1c2022"
theme.border_focus                              = "#606060"
theme.border_marked                             = "#3ca4d8"
theme.menu_border_width                         = 0
theme.menu_width                                = 130
theme.menu_submenu_icon                         = theme.confdir .. "/icons/submenu.png"
theme.menu_fg_normal                            = "#aaaaaa"
theme.menu_fg_focus                             = "#ff8c00"
theme.menu_bg_normal                            = "#050505dd"
theme.menu_bg_focus                             = "#050505dd"
theme.widget_temp_cpu                           = theme.confdir .. "/icons/temp_cpu.png"
theme.widget_temp_gpu                           = theme.confdir .. "/icons/temp_gpu.png"
theme.widget_fan                                = theme.confdir .. "/icons/fs.png"
theme.widget_uptime                             = theme.confdir .. "/icons/ac.png"
theme.widget_cpu                                = theme.confdir .. "/icons/cpu.png"
theme.widget_mem                                = theme.confdir .. "/icons/mem.png"
theme.widget_note                               = theme.confdir .. "/icons/note.png"
theme.widget_note_on                            = theme.confdir .. "/icons/note_on.png"
theme.widget_netdown                            = theme.confdir .. "/icons/net_down.png"
theme.widget_netup                              = theme.confdir .. "/icons/net_up.png"
theme.widget_mail                               = theme.confdir .. "/icons/mail.png"
theme.widget_batt                               = theme.confdir .. "/icons/bat.png"
theme.widget_clock                              = theme.confdir .. "/icons/clock.png"
theme.widget_vol                                = theme.confdir .. "/icons/spkr.png"
theme.taglist_squares_sel                       = theme.confdir .. "/icons/square_a.png"
theme.taglist_squares_unsel                     = theme.confdir .. "/icons/square_b.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 0
theme.layout_tile                               = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps                           = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft                           = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.confdir .. "/icons/dwindle.png"
theme.layout_max                                = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.confdir .. "/icons/floating.png"
theme.titlebar_close_button_normal              = theme.confdir .. "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.confdir .. "/icons/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.confdir .. "/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.confdir .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.confdir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.confdir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.confdir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.confdir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.confdir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.confdir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.confdir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.confdir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.confdir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.confdir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.confdir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.confdir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.confdir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.confdir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.confdir .. "/icons/titlebar/maximized_focus_active.png"

local markup = lain.util.markup

-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local mytextclock = wibox.widget.textclock(markup("#7788af", "%A %d %B ") .. markup("#535f7a", ">") .. markup("#de5e1e", " %H:%M "))
mytextclock.font = theme.font

-- Mail IMAP check
local mailicon = wibox.widget.imagebox(theme.widget_mail)
local mail1 = lain.widgets.imap({
    timeout  = 60,
    server   = "imap.gmx.net",
    mail     = "danielkauth@gmx.de",
    password = "gpg2 -dq /home/daniel/.config/awesome/pass_gmx.gpg",
    is_plain = false,
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#ffffff", mailcount .. " "))
    end
})

local mail2 = lain.widgets.imap({
    timeout  = 60,
    server   = "imap.igd.fraunhofer.de",
    mail     = "dkauth",
    password = "gpg2 -dq /home/daniel/.config/awesome/pass_gris.gpg",
    is_plain = false,
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#ffffff", mailcount .. " "))
    end
})

mail1.widget:set_markup(markup.fontfg(theme.font, "#ffffff", "0 "))
mail2.widget:set_markup(markup.fontfg(theme.font, "#ffffff", "0 "))

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widgets.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#e33a6e", cpu_now.usage .. "% "))
    end
})

-- Fancontrol
local fanicon = wibox.widget.imagebox(theme.widget_fan)
theme.fan = wibox.widget.textbox()

-- GPU temp
local tempicon_gpu = wibox.widget.imagebox(theme.widget_temp_gpu)
local temp_gpu = wibox.widget.textbox()

-- Coretemp
local tempicon_cpu = wibox.widget.imagebox(theme.widget_temp_cpu)
local temp_cpu = lain.widgets.temp({
    timeout = 1,
    settings = function()
        -- CPU temp
        widget:set_markup(markup.fontfg(theme.font, "#f1af5f",
                          math.floor(coretemp_now) .. "°C "))

        -- GPU temp
        local gpu_temp = capture("nvidia-settings -tq gpucoretemp"):sub(0, 2)
        local gpu_temp_num = tonumber(gpu_temp)
        temp_gpu:set_markup(markup.fontfg(theme.font, "#625fff", gpu_temp_num .. "°C "))

        -- fan data
        local temp_file = io.open("/tmp/fan_data", "r")
        if temp_file then
            local temp_data = temp_file:read("*a")
            theme.fan:set_markup(markup.fontfg(theme.font, "#6fb1b0", temp_data .. " "))
        end
    end
})

-- Battery
local baticon = wibox.widget.imagebox(theme.widget_batt)
local bat = lain.widgets.bat({
    settings = function()
        if bat_now.perc ~= "N/A" then
            bat_now.perc = bat_now.perc .. "%"
        end
        if bat_now.ac_status == 1 then
            bat_now.perc = bat_now.perc .. " plug"
        end

        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, bat_now.perc .. " "))
    end
})

-- PULSE volume
--local volicon = wibox.widget.imagebox(theme.widget_vol)
--theme.volume = lain.widgets.pulseaudio({
--    settings = function()
--        if volume_now.status == "off" then
--            volume_now.level = volume_now.level .. "M"
--        end

        -- TODO volume
--        widget:set_markup(markup.fontfg(theme.font, "#7493d2", "100% "))
--    end
--})

-- Net
local netdownicon = wibox.widget.imagebox(theme.widget_netdown)
local netdowninfo = wibox.widget.textbox()
local netupicon = wibox.widget.imagebox(theme.widget_netup)
local netupinfo = lain.widgets.net({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#e54c62", net_now.sent .. " "))
        netdowninfo:set_markup(markup.fontfg(theme.font, "#87af5f", net_now.received .. " "))
    end
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local memory = lain.widgets.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#e0da37", mem_now.used .. "M "))
    end
})

function theme.at_screen_connect(s)
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == "function" then
        theme.wallpaper = theme.wallpaper(s)
    end
    gears.wallpaper.maximized(theme.wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 20, bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --s.mylayoutbox,
            s.mytaglist,
            s.mypromptbox,
        },
        --s.mytasklist, -- Middle widget
        nil,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            mailicon,
            mail1.widget,
            mail2.widget,
            netdownicon,
            netdowninfo,
            netupicon,
            netupinfo.widget,
            --volicon,
            --theme.volume.widget,
            memicon,
            memory.widget,
            cpuicon,
            cpu.widget,
            tempicon_cpu,
            temp_cpu.widget,
            tempicon_gpu,
            temp_gpu,
            fanicon,
            theme.fan,
            baticon,
            bat.widget,
            clockicon,
            mytextclock,
        },
    }

end

return theme
