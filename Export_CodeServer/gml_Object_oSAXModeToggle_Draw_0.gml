var str;
draw_self()
if global.saxmode
    str = "On"
else
    str = "Off"
draw_text(1120, 920, ("SA-X Mode: " + str))
