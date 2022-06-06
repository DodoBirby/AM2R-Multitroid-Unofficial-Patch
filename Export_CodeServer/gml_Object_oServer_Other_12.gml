var list;
if file_exists((working_directory + global.saveString))
{
    list = ds_list_create()
    file = file_text_open_read((working_directory + global.saveString))
    ds_list_read(list, file_text_read_string(file))
    file_text_close(file)
    global.metdead = ds_list_find_value(list, 0)
    global.event = ds_list_find_value(list, 1)
    global.itemSamus = ds_list_find_value(list, 2)
    global.dmapSamus = ds_list_find_value(list, 3)
    global.monstersleft = ds_list_find_value(list, 4)
    global.itemSAX = ds_list_find_value(list, 5)
    global.dmapSAX = ds_list_find_value(list, 6)
    ds_list_destroy(list)
    alarm[2] = 30
    alarm[5] = 30
    oLoad.alarm[0] = 120
}
else
    oLoad.alarm[1] = 120
