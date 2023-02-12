var str, diffStr, ELMStr, i, arrList, color;
if (server >= 0)
    str = ("Running on " + string(port))
else
    str = "Not running, cannot open port"
switch syncedDifficulty
{
    case 0:
        diffStr = "Easy"
        break
    case 1:
        diffStr = "Normal"
        break
    case 2:
        diffStr = "Hard"
        break
    case 3:
        diffStr = "Fusion"
        break
}

switch syncedELM
{
    case 0:
        ELMStr = "Disabled"
        break
    case 1:
        ELMStr = "Enabled"
        break
}

draw_set_font(font0)
draw_text(5, 5, ("AM2R Server: " + string(str)))
draw_text(5, 35, ((("Connected Clients: " + string(ds_list_size(playerList))) + "/") + string(maxClients)))
draw_text(5, 75, ("Doomsday Time: " + string(global.doomtime)))
draw_text(5, 105, ("Seconds till Doomsday: " + string((global.gametime / 60))))
draw_text(5, 135, ("Metroids Required for A6: " + string(global.MetCount)))
draw_text(5, 165, (("Power Bomb Tanks: " + string(global.ptanks)) + "/10"))
draw_text(5, 195, ("Total Remaining Metroids: " + string(global.monstersleft)))
draw_text(5, 225, ("Seed: " + string(global.seed)))
draw_text(5, 255, ("Difficulty: " + string(diffStr)))
draw_text(5, 285, ("Extreme Lab Metroids: " + string(ELMStr)))
if (ds_list_size(idList) > 0)
{
    draw_text(5, 315, "Players:")
    for (i = 0; i < ds_list_size(idList); i++)
    {
        arrList = ds_list_find_value(idList, i)
        if (array_length_2d(arrList, 0) > 2)
        {
            color = c_black
            switch arrList[0, 0]
            {
                case 1:
                    color = c_green
                    break
                case 2:
                    color = c_red
                    break
                case 3:
                    color = c_blue
                    break
                case 4:
                    color = c_yellow
                    break
                case 5:
                    color = c_orange
                    break
                case 6:
                    color = c_purple
                    break
                case 7:
                    color = c_fuchsia
                    break
                case 8:
                    color = c_white
                    break
                case 9:
                    color = make_color_rgb(204, 255, 83)
                    break
                case 10:
                    color = make_color_rgb(255, 109, 51)
                    break
                case 11:
                    color = make_color_rgb(105, 165, 255)
                    break
                case 12:
                    color = make_color_rgb(255, 198, 45)
                    break
                case 13:
                    color = make_color_rgb(229, 162, 97)
                    break
                case 14:
                    color = make_color_rgb(155, 88, 255)
                    break
                case 15:
                    color = make_color_rgb(254, 4, 222)
                    break
                case 16:
                    color = make_color_rgb(163, 217, 184)
                    break
            }

            draw_text_color(5, (317 + ((i + 1) * 30)), arrList[0, 2], color, color, color, color, 1)
        }
    }
}
