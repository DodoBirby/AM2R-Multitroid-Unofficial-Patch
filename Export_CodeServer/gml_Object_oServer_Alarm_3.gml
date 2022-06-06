var size, type, alignment, i, bufferSize, sockets;
if global.eventSync
{
    size = 1024
    type = buffer_grow
    alignment = 1
    eventBuffer = buffer_create(size, type, alignment)
    buffer_seek(eventBuffer, buffer_seek_start, 0)
    buffer_write(eventBuffer, buffer_u8, 51)
    for (i = 0; i < array_length_1d(global.event); i++)
        buffer_write(eventBuffer, buffer_u8, global.event[i])
    bufferSize = buffer_tell(eventBuffer)
    buffer_seek(eventBuffer, buffer_seek_start, 0)
    buffer_write(eventBuffer, buffer_s32, bufferSize)
    buffer_write(eventBuffer, buffer_u8, 51)
    for (i = 0; i < array_length_1d(global.event); i++)
        buffer_write(eventBuffer, buffer_u8, global.event[i])
    sockets = ds_list_size(playerList)
    for (i = 0; i < sockets; i++)
        network_send_packet(ds_list_find_value(playerList, i), eventBuffer, buffer_tell(eventBuffer))
    buffer_delete(eventBuffer)
    alarm[3] = 360
}
else
    alarm[3] = 300
