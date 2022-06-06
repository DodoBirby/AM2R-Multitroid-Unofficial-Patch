var sockets, size, type, alignment, bufferSize, i, getGravity;
sockets = ds_list_size(playerList)
buffer_delete(buffer)
size = 1024
type = buffer_grow
alignment = 1
buffer = buffer_create(size, type, alignment)
buffer_seek(buffer, buffer_seek_start, 0)
buffer_write(buffer, buffer_u8, 29)
buffer_write(buffer, buffer_u8, syncedDifficulty)
bufferSize = buffer_tell(buffer)
buffer_seek(buffer, buffer_seek_start, 0)
buffer_write(buffer, buffer_s32, bufferSize)
buffer_write(buffer, buffer_u8, 29)
buffer_write(buffer, buffer_u8, syncedDifficulty)
for (i = 0; i < sockets; i++)
    network_send_packet(ds_list_find_value(playerList, i), buffer, buffer_tell(buffer))
buffer_delete(buffer)
size = 1024
type = buffer_grow
alignment = 1
buffer = buffer_create(size, type, alignment)
buffer_seek(buffer, buffer_seek_start, 0)
buffer_write(buffer, buffer_u8, 30)
buffer_write(buffer, buffer_u8, syncedELM)
bufferSize = buffer_tell(buffer)
buffer_seek(buffer, buffer_seek_start, 0)
buffer_write(buffer, buffer_s32, bufferSize)
buffer_write(buffer, buffer_u8, 30)
buffer_write(buffer, buffer_u8, syncedELM)
for (i = 0; i < sockets; i++)
    network_send_packet(ds_list_find_value(playerList, i), buffer, buffer_tell(buffer))
getGravity = 0
if (global.itemSamus[5] && global.itemSamus[9])
    getGravity = 1
buffer_delete(buffer)
size = 1024
type = buffer_grow
alignment = 1
buffer = buffer_create(size, type, alignment)
buffer_seek(buffer, buffer_seek_start, 0)
buffer_write(buffer, buffer_u8, 115)
buffer_write(buffer, buffer_u8, getGravity)
bufferSize = buffer_tell(buffer)
buffer_seek(buffer, buffer_seek_start, 0)
buffer_write(buffer, buffer_s32, bufferSize)
buffer_write(buffer, buffer_u8, 115)
buffer_write(buffer, buffer_u8, getGravity)
for (i = 0; i < sockets; i++)
    network_send_packet(ds_list_find_value(playerList, i), buffer, buffer_tell(buffer))
buffer_delete(buffer)
size = 1024
type = buffer_grow
alignment = 1
buffer = buffer_create(size, type, alignment)
buffer_seek(buffer, buffer_seek_start, 0)
buffer_write(buffer, buffer_u8, 116)
buffer_write(buffer, buffer_string, sha1_string_unicode(password))
bufferSize = buffer_tell(buffer)
buffer_seek(buffer, buffer_seek_start, 0)
buffer_write(buffer, buffer_s32, bufferSize)
buffer_write(buffer, buffer_u8, 116)
buffer_write(buffer, buffer_string, sha1_string_unicode(password))
for (i = 0; i < sockets; i++)
    network_send_packet(ds_list_find_value(playerList, i), buffer, buffer_tell(buffer))
alarm[0] = 90
