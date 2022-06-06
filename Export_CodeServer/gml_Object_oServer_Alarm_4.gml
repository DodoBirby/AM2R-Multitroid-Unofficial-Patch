var size, type, alignment, i, bufferSize, sockets;
if global.metroidSync
{
    size = 1024
    type = buffer_grow
    alignment = 1
    metdeadBuffer = buffer_create(size, type, alignment)
    buffer_seek(metdeadBuffer, buffer_seek_start, 0)
    buffer_write(metdeadBuffer, buffer_u8, 52)
    for (i = 0; i < array_length_1d(global.metdead); i++)
        buffer_write(metdeadBuffer, buffer_u8, global.metdead[i])
    bufferSize = buffer_tell(metdeadBuffer)
    buffer_seek(metdeadBuffer, buffer_seek_start, 0)
    buffer_write(metdeadBuffer, buffer_s32, bufferSize)
    buffer_write(metdeadBuffer, buffer_u8, 52)
    for (i = 0; i < array_length_1d(global.metdead); i++)
        buffer_write(metdeadBuffer, buffer_u8, global.metdead[i])
    sockets = ds_list_size(playerList)
    for (i = 0; i < sockets; i++)
        network_send_packet(ds_list_find_value(playerList, i), metdeadBuffer, buffer_tell(metdeadBuffer))
    buffer_delete(metdeadBuffer)
    alarm[4] = 420
}
else
    alarm[4] = 300
