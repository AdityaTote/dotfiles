-- Hyprland configuration

local home = os.getenv("HOME")
local scripts = home .. "/.config/hypr/scripts/"

-- Monitors
hl.monitor({
    output = "",
    mode = "1920x1080@90",
    position = "0x0",
    scale = 1,
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "preferred",
    position = "auto",
    scale = 1,
})

-- Programs
local terminal = "wezterm"
local fileManager = "nautilus"
local menu = "wofi --show drun"

-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("env GSK_RENDERER=gl swaync")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd(scripts .. "battery-alert.sh")
end)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Appearance and layout
hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 5,
        border_size = 0,
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 2,
        rounding_power = 2,
        active_opacity = 1,
        inactive_opacity = 0.8,
        shadow = {
            enabled = true,
            range = 12,
            render_power = 4,
            color = "rgba(00000099)",
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
    },
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("snappy", { type = "bezier", points = { { 0.3, 1.2 }, { 0.4, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("fastSmooth", { type = "bezier", points = { { 0.4, 0 }, { 0.2, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 6, bezier = "fastSmooth" })
hl.animation({ leaf = "border", enabled = true, speed = 4.5, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 3.6, bezier = "fastSmooth" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3.4, bezier = "snappy", style = "popin 88%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.3, bezier = "snappy", style = "popin 85%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.6, bezier = "quick" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.3, bezier = "quick" })
hl.animation({ leaf = "fade", enabled = true, speed = 2.6, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.3, bezier = "fastSmooth" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3.6, bezier = "snappy", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.3, bezier = "snappy", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.6, bezier = "quick" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.3, bezier = "quick" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.6, bezier = "snappy", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.1, bezier = "snappy", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.6, bezier = "snappy", style = "fade" })

-- Input
hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "caps:escape",
        kb_rules = "",
        numlock_by_default = true,
        follow_mouse = 1,
        sensitivity = 0.2,
        accel_profile = "adaptive",
        natural_scroll = false,
        touchpad = {
            natural_scroll = false,
            disable_while_typing = true,
        },
    },
    gestures = {
        workspace_swipe_distance = 300,
        workspace_swipe_invert = false,
    },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

-- Keybindings
local mainMod = "SUPER"

hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo({ action = "toggle" }))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(scripts .. "browser.sh"))

hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd(scripts .. "wofi-file-search.sh"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(scripts .. "wofi-clipboard.sh"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(scripts .. "wofi-emoji.sh"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(scripts .. "wofi-ssh.sh"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd(scripts .. "wofi-power.sh"))

hl.bind(mainMod .. " + TAB", hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.window.cycle_next({ next = false }))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd(scripts .. "lock-and-suspend.sh"))
hl.bind(mainMod .. " + CTRL + P", hl.dsp.exec_cmd(scripts .. "reload-hyprpaper.sh"))
hl.bind(mainMod .. " + CTRL + W", hl.dsp.exec_cmd(scripts .. "reload-waybar.sh"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("wezterm start -- lazydocker"))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
