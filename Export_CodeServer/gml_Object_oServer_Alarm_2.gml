var size, type, alignment, sockets, i, f, arr, arrID, arrSocket, findID, v, bufferSize;
if global.itemSync
{
    size = 1024
    type = buffer_grow
    alignment = 1
    itemBuffer = buffer_create(size, type, alignment)
    sockets = ds_list_size(playerList)
    for (i = 0; i < sockets; i++)
    {
        for (f = 0; f < ds_list_size(idList); f++)
        {
            arr = ds_list_find_value(idList, f)
            arrID = arr[0, 0]
            arrSocket = arr[0, 1]
            if (arrSocket == ds_list_find_value(playerList, i))
            {
                findID = ds_list_find_index(samusList, arrID)
                if (findID >= 0)
                {
                    buffer_seek(itemBuffer, buffer_seek_start, 0)
                    buffer_write(itemBuffer, buffer_u8, 50)
                    for (v = 0; v < array_length_1d(global.itemSamus); v++)
                        buffer_write(itemBuffer, buffer_u8, global.itemSamus[v])
                    bufferSize = buffer_tell(itemBuffer)
                    buffer_seek(itemBuffer, buffer_seek_start, 0)
                    buffer_write(itemBuffer, buffer_s32, bufferSize)
                    buffer_write(itemBuffer, buffer_u8, 50)
                    for (v = 0; v < array_length_1d(global.itemSamus); v++)
                        buffer_write(itemBuffer, buffer_u8, global.itemSamus[v])
                    network_send_packet(ds_list_find_value(playerList, i), itemBuffer, buffer_tell(itemBuffer))
                }
                findID = ds_list_find_index(saxList, arrID)
                if (findID >= 0)
                {
                    buffer_seek(itemBuffer, buffer_seek_start, 0)
                    buffer_write(itemBuffer, buffer_u8, 50)
                    for (v = 0; v < array_length_1d(global.itemSAX); v++)
                        buffer_write(itemBuffer, buffer_u8, global.itemSAX[v])
                    bufferSize = buffer_tell(itemBuffer)
                    buffer_seek(itemBuffer, buffer_seek_start, 0)
                    buffer_write(itemBuffer, buffer_s32, bufferSize)
                    buffer_write(itemBuffer, buffer_u8, 50)
                    for (v = 0; v < array_length_1d(global.itemSAX); v++)
                        buffer_write(itemBuffer, buffer_u8, global.itemSAX[v])
                    network_send_packet(ds_list_find_value(playerList, i), itemBuffer, buffer_tell(itemBuffer))
                }
            }
        }
    }
    buffer_delete(itemBuffer)
    alarm[2] = 300
}
else
    alarm[2] = 300
