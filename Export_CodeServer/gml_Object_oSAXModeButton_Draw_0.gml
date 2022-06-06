var str, findIDSamus, findIDSAX, str2, currentRoom;
draw_self()
if instance_exists(oServer)
{
    str = ""
    findIDSamus = ds_list_find_index(oServer.samusList, ID)
    if (findIDSamus >= 0)
        str = "Normal:"
    findIDSAX = ds_list_find_index(oServer.saxList, ID)
    if (findIDSAX >= 0)
        str = "SA-X:"
    draw_text((x + 70), y, str)
    str2 = ""
    currentRoom = ds_map_find_value(global.readyMap, ID)
    if ((!is_undefined(currentRoom)) && currentRoom != 0 && currentRoom != 1 && currentRoom != 4 && currentRoom != 5 && currentRoom != 6 && currentRoom != 13 && currentRoom != 14 && currentRoom != 15)
        str2 = "Ready"
    else
        str2 = "Not ready"
    draw_text((x + 140), y, str2)
}
