import os
import subprocess
from libqtile import layout, hook, bar, widget
from libqtile.config import Click, Drag, Group, Key, Match, ScratchPad, DropDown, Screen
from libqtile.lazy import lazy

colors = {
    "gray900":  "18181b",
    "gray300":  "d4d4d8",
    "gray50":  "fafafa",
    "rose900":  "881337",
    "rose300":  "fda4af",
    "rose50":  "fff1f2",
    "red600":  "dc2626",
    "red50":  "fef2f2",
    "yellow200":  "fef08a",
    "green500":  "22c55e",
    "black":  "000000",
    "fuchsia900": "701a75",
    "fuchsia600": "c026d3",
    "transparent": "00000000",
}

mod = "mod4"
terminal = "alacritty"

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    # Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    # Key(
    #     [mod, "shift"],
    #     "Return",
    #     lazy.layout.toggle_split(),
    #     desc="Toggle between split and unsplit sides of stack",
    # ),
    Key([mod, "shift"], "Return", lazy.spawn(
        terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "Escape", lazy.shutdown(), desc="Shutdown Qtile"),
    # Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    # Custom keybindings

    # Screen lock
    Key([mod, "control", "shift"], "l", lazy.spawn("wm_lock"),
        desc="Lock screen"),

    # Change keyboard layout
    Key([mod], "space", lazy.widget["keyboardlayout"].next_keyboard(),
        desc="Next keyboard layout"),
    # Fullscreen
    Key([mod], "f", lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen"),
    # Floating windows
    Key([mod, "shift"], "Space",
        lazy.window.toggle_floating(),
        desc="Toggle floating"),
    # Media
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%"),
        desc="Increase volume"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%"),
        desc="Decrease volume"),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"),
        desc="Mute volume"),
    Key([], "XF86AudioMicMute", lazy.spawn("pactl set-source-mute @DEFAULT_SOURCE@ toggle"),
        desc="Mute microphone"),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"),
        desc="Play/Pause music"),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next"),
        desc="Next song"),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"),
        desc="Previous song"),

    # Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 1"),
        desc="Increase brightness"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 1"),
        desc="Decrease brightness"),

    # Browser
    Key([mod], "b", lazy.spawn(os.environ["BROWSER"]),
        desc="Launch browser"),

    # Program launcher
    Key([mod], "a", lazy.spawn("wm_program_launcher"),
        desc="Launch rofi"),

    # Run prompt
    Key([mod], "r", lazy.spawn("wm_run_prompt"),
        desc="Launch rofi run prompt"),

    # Screenshots
    Key([], "Print", lazy.spawn("wm_screenshot full"),
        desc="Take screenshot"),
    Key([mod], "Print", lazy.spawn("wm_screenshot window"),
        desc="Take screenshot of window"),
    Key(["shift"], "Print", lazy.spawn("wm_screenshot select"),
        desc="Take screenshot of selection"),

    # Screenshots to clipboard
    Key(["control"], "Print", lazy.spawn("wm_screenshot full -c"),
        desc="Take screenshot to clipboard"),
    Key([mod, "control"], "Print", lazy.spawn("wm_screenshot window -c"),
        desc="Take screenshot of window to clipboard"),
    Key(["shift", "control"], "Print", lazy.spawn("wm_screenshot select -c"),
        desc="Take screenshot of selection to clipboard"),

    # Clipboard manager
    Key([mod], "c", lazy.spawn("wm_clipboard_manager"),
        desc="Launch clipboard manager"),

    # Emoji picker
    Key([mod], "e", lazy.spawn("wm_emoji_picker"),
        desc="Launch emoji picker"),

    # Power menu
    Key([mod], "p", lazy.spawn("wm_power_menu"),
        desc="Launch power menu"),

    # Network manager
    Key([mod], "n", lazy.spawn("wm_network_manager"),
        desc="Launch network manager"),

    # Toggle bar
    Key([mod], "grave", lazy.hide_show_bar(), desc="Toggle visibility of Bar"),
]

scratchpad_config = {
    "height": 0.8,
    "width": 0.8,
    "x": 0.1,
    "y": 0.1,
    "on_focus_lost_hide": True,
}

groups = [Group(i) for i in "1234567890"]

for group in groups:
    keys.extend(
        [
            # Switch to group
            Key(
                [mod],
                group.name,
                lazy.group[group.name].toscreen(),
                desc="Switch to {} group".format(group.label),
            ),

            # Move focused window to group
            Key(
                [mod, "shift"],
                group.name,
                lazy.window.togroup(group.name),
                desc="Move focused window to  {} group".format(
                    group.label),
            ),
        ]
    )

groups.append(ScratchPad("scratchpad", [
    DropDown("term", "alacritty", **scratchpad_config),
    # DropDown("ranger", "alacritty -e ranger", **scratchpad_config),
    DropDown("htop", "alacritty -e htop", **scratchpad_config),
    DropDown("ncmpcpp", "alacritty -e ncmpcpp", **scratchpad_config),
]))

keys.extend(
    [
        # Scratchpads
        # Terminal
        Key([mod], "Return", lazy.group["scratchpad"].dropdown_toggle("term"),
            desc="Toggle terminal dropdown"),

        # File manager
        # Key([mod], "f", lazy.group["scratchpad"].dropdown_toggle("ranger"),
        #     desc="Toggle file manager dropdown"),

        # System monitor
        Key([mod], "s", lazy.group["scratchpad"].dropdown_toggle("htop"),
            desc="Toggle system monitor dropdown"),

        # Music player
        Key([mod], "m", lazy.group["scratchpad"].dropdown_toggle("ncmpcpp"),
            desc="Toggle music player dropdown"),
    ])

layouts = [
    layout.Columns(
        border_width=2,
        border_focus=colors["fuchsia600"],
        border_normal=colors["fuchsia900"],
        border_on_single=True,
        margin=8,
    ),
    layout.Max(
        border_width=0,
        # border_focus=colors["fuchsia600"],
        margin=8,
    ),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="DejaVuSansM Nerd Font",
    fontsize=14,
    padding=5,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar([
            widget.GroupBox(
                highlight_method="line",
                center_aligned=True,
                hide_unused=True,
                rounded=False,
                this_current_screen_border=colors["fuchsia600"],
                highlight_color=[colors["black"], colors["black"]],
                inactive="666666",
                active=colors["gray50"],
                use_mouse_wheel=False,
                disable_drag=True,
            ),
            widget.Spacer(),
            widget.Systray(),
            widget.Sep(padding=10),
            widget.Wlan(
                format="  {essid}",
                disconnected_message="  Disconnected",
            ),
            widget.Sep(padding=10),
            widget.Battery(
                # Battery icon {char} and percentage {percent:2.0%
                format="{char} {percent:2.0%}",
                charge_char="🔌 Charging",
                discharge_char="⚡ Discharging",
                empty_char="🪫 BATTERY LOW",
                full_char="🔋 FULL BATTERY",
                unknown_char="???",
                notify_below=30,
                show_short_text=False,
                update_interval=5,
            ),
            widget.Sep(padding=10),
            widget.KeyboardLayout(
                configured_keyboards=["us", "ara"],
                display_map={"us": "🇺🇸 EN", "ara": "🇪🇬 AR"},
                option="grp:win_space_toggle",
            ),
            widget.Sep(padding=10),
            widget.Backlight(
                backlight_name="intel_backlight",
                fmt="🔆 {}",
                step=1,
            ),
            widget.Sep(padding=10),
            widget.Volume(
                emoji=True,
                fmt='{}'
            ),
            widget.Volume(),
            widget.Sep(padding=10),
            widget.Clock(format="%a, %d %B", fmt="📅 {}"),
            widget.Sep(padding=10),
            widget.Clock(format="%l:%M %p", fmt="🕒 {}"),
            widget.Sep(padding=10),
            widget.CurrentLayoutIcon(scale=0.65),
        ], 24)),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    border_width=0,
    # border_focus=colors["fuchsia600"],
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "focus"  # or smart
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

wmname = "LG3D"


@hook.subscribe.startup_once
def autostart():
    # Set brightness to 1% on startup
    subprocess.call(["xbacklight", "-set", "1"])
