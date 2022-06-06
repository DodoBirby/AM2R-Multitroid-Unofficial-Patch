var size, type, alignment, sockets, v, f, arr, arrID, arrSocket, findID, i, j, bufferSize;
size = 1024
type = buffer_grow
alignment = 1
dmapBuffer = buffer_create(size, type, alignment)
sockets = ds_list_size(playerList)
for (v = 0; v < sockets; v++)
{
    for (f = 0; f < ds_list_size(idList); f++)
    {
        arr = ds_list_find_value(idList, f)
        arrID = arr[0, 0]
        arrSocket = arr[0, 1]
        if (arrSocket == ds_list_find_value(playerList, v))
        {
            findID = ds_list_find_index(samusList, arrID)
            if (findID >= 0)
            {
                buffer_seek(dmapBuffer, buffer_seek_start, 0)
                buffer_write(dmapBuffer, buffer_u8, 53)
                buffer_write(dmapBuffer, buffer_u8, 2)
                for (i = 0; i < array_height_2d(global.dmapSamus); i++)
                {
                    for (j = 0; j < array_length_2d(global.dmapSamus, i); j++)
                    {
                        if (i >= 20 && i < 40)
                            buffer_write(dmapBuffer, buffer_u8, global.dmapSamus[i, j])
                    }
                }
                bufferSize = buffer_tell(dmapBuffer)
                buffer_seek(dmapBuffer, buffer_seek_start, 0)
                buffer_write(dmapBuffer, buffer_s32, bufferSize)
                buffer_write(dmapBuffer, buffer_u8, 53)
                buffer_write(dmapBuffer, buffer_u8, 2)
                for (i = 0; i < array_height_2d(global.dmapSamus); i++)
                {
                    for (j = 0; j < array_length_2d(global.dmapSamus, i); j++)
                    {
                        if (i >= 20 && i < 40)
                            buffer_write(dmapBuffer, buffer_u8, global.dmapSamus[i, j])
                    }
                }
                network_send_packet(ds_list_find_value(playerList, v), dmapBuffer, buffer_tell(dmapBuffer))
            }
            findID = ds_list_find_index(saxList, arrID)
            if (findID >= 0)
            {
                buffer_seek(dmapBuffer, buffer_seek_start, 0)
                buffer_write(dmapBuffer, buffer_u8, 53)
                buffer_write(dmapBuffer, buffer_u8, 2)
                for (i = 0; i < array_height_2d(global.dmapSAX); i++)
                {
                    for (j = 0; j < array_length_2d(global.dmapSAX, i); j++)
                    {
                        if (i >= 20 && i < 40)
                            buffer_write(dmapBuffer, buffer_u8, global.dmapSAX[i, j])
                    }
                }
                bufferSize = buffer_tell(dmapBuffer)
                buffer_seek(dmapBuffer, buffer_seek_start, 0)
                buffer_write(dmapBuffer, buffer_s32, bufferSize)
                buffer_write(dmapBuffer, buffer_u8, 53)
                buffer_write(dmapBuffer, buffer_u8, 2)
                for (i = 0; i < array_height_2d(global.dmapSAX); i++)
                {
                    for (j = 0; j < array_length_2d(global.dmapSAX, i); j++)
                    {
                        if (i >= 20 && i < 40)
                            buffer_write(dmapBuffer, buffer_u8, global.dmapSAX[i, j])
                    }
                }
                network_send_packet(ds_list_find_value(playerList, v), dmapBuffer, buffer_tell(dmapBuffer))
            }
        }
    }
}
buffer_delete(dmapBuffer)
alarm[7] = 120
