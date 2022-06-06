draw_self()
if (alarm[0] > 0)
{
    draw_set_halign(fa_right)
    draw_text((x - 12), (y + 12), (("Saved slot " + string(global.slot)) + "!"))
    draw_set_halign(fa_left)
}
