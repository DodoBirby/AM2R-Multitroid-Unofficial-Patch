var ID, input, modPassword;
ID = ds_map_find_value(async_load, "id")
if (ID == msg)
{
    if ds_map_find_value(async_load, "status")
    {
        input = ds_map_find_value(async_load, "result")
        if is_string(input)
        {
            ini_open((working_directory + "\settings.ini"))
            modPassword = ini_read_string("Settings", "moderatorpass", "123456789")
            ini_close()
            if (input != modPassword)
            {
                if instance_exists(oServer)
                {
                    if (string_length(input) > 15)
                        input = string_copy(input, 1, 15)
                    oServer.password = input
                    ini_open((working_directory + "\settings.ini"))
                    ini_write_string("Settings", "moderatorpass", input)
                    ini_close()
                }
            }
        }
    }
}
