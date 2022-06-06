var size, type, alignment, bufferSize;
buffer_delete(buffer)
size = 1024
type = buffer_grow
alignment = 1
buffer = buffer_create(size, type, alignment)
buffer_seek(buffer, buffer_seek_start, 0)
buffer_write(buffer, buffer_u8, 111)
buffer_write(buffer, buffer_u8, global.newTeam)
bufferSize = buffer_tell(buffer)
buffer_seek(buffer, buffer_seek_start, 0)
buffer_write(buffer, buffer_s32, bufferSize)
buffer_write(buffer, buffer_u8, 111)
buffer_write(buffer, buffer_u8, global.newTeam)
network_send_packet(global.newTeamSocket, buffer, buffer_tell(buffer))
