var str;
draw_self()
if instance_exists(oServer)
{
    switch global.rando
    {
        case 0:
            str = "Classic"
            break
        case 1:
            str = "AM2Random"
            break
        case 2:
            str = "Split Power-ups"
            break
        case 3:
            str = "Split Items"
            break
    }

    draw_set_halign(fa_center)
    draw_text((x + (sprite_width / 2)), (y - 36), str)
    draw_set_halign(fa_left)
}
