var i, arr, arrID, arrIP, found;
if instance_exists(oServer)
{
    if (ds_list_size(oServer.idList) > 0)
    {
        if (!instance_exists(oBanButton))
        {
            for (i = 0; i < ds_list_size(oServer.idList); i++)
            {
                if (!(is_undefined(ds_list_find_value(oServer.idList, i))))
                {
                    arr = ds_list_find_value(oServer.idList, i)
                    show_debug_message(string(arr))
                    if is_array(arr)
                        show_debug_message("is array")
                    show_debug_message(string(arr[0, 0]))
                    arrID = arr[0, 0]
                    arrIP = arr[0, 3]
                    button = instance_create(150, (317 + ((i + 1) * 30)), oBanButton)
                    button.ID = arrID
                    button.IP = arrIP
                }
            }
        }
        else
        {
            for (i = 0; i < ds_list_size(oServer.idList); i++)
            {
                if (!(is_undefined(ds_list_find_value(oServer.idList, i))))
                {
                    arr = ds_list_find_value(oServer.idList, i)
                    arrID = arr[0, 0]
                    arrIP = arr[0, 3]
                    found = 0
                    with (oBanButton)
                    {
                        if (arrID == ID)
                            found = 1
                    }
                    if (!found)
                    {
                        button = instance_create(150, (317 + ((i + 1) * 30)), oBanButton)
                        button.ID = arrID
                        button.IP = arrIP
                    }
                }
            }
        }
    }
}
