var size, type, alignment, bufferSize, sockets, i;
show_debug_message("event ran")
reset_globals()
buffer_delete(buffer)
size = 1024
type = buffer_grow
alignment = 1
buffer = buffer_create(size, type, alignment)
buffer_seek(buffer, buffer_seek_start, 0)
buffer_write(buffer, buffer_u8, 106)
bufferSize = buffer_tell(buffer)
buffer_seek(buffer, buffer_seek_start, 0)
buffer_write(buffer, buffer_s32, bufferSize)
buffer_write(buffer, buffer_u8, 106)
sockets = ds_list_size(playerList)
for (i = 0; i < sockets; i++)
    network_send_packet(ds_list_find_value(playerList, i), buffer, buffer_tell(buffer))
global.lobbyLocked = 0
alarm[11] = 1
