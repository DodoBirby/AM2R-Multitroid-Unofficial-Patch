draw_self()
if (alarm[0] > 0)
{
    draw_set_halign(fa_right)
    draw_text((x - 12), (y + 12), (("Loaded slot " + string(global.slot)) + "!"))
    draw_set_halign(fa_left)
}
if (alarm[1] > 0)
{
    draw_set_halign(fa_right)
    draw_text((x - 12), (y + 12), (("Save " + string(global.slot)) + " doesn't exist!"))
    draw_set_halign(fa_left)
}
