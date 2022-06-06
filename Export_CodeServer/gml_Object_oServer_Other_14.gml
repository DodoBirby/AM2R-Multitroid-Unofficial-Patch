var saxCountMax, saxCount, sockets, i, newTeam, size, type, alignment, bufferSize, f, arrList, findIDSAX, findIDSamus;
saxCountMax = 0
saxCount = 0
sockets = ds_list_size(playerList)
newTeamList = ds_list_create()
if (sockets > 2)
{
    saxCountMax = round((sockets / 2))
    if (saxCountMax > (sockets / 2))
        saxCountMax--
    for (i = 0; i < sockets; i++)
    {
        if (saxCount < saxCountMax)
        {
            ds_list_set(newTeamList, i, 2)
            saxCount++
        }
        else
            ds_list_set(newTeamList, i, 1)
    }
    ds_list_shuffle(newTeamList)
}
else if (sockets == 2)
{
    ds_list_set(newTeamList, 0, 1)
    ds_list_set(newTeamList, 1, 2)
    ds_list_shuffle(newTeamList)
}
for (i = 0; i < sockets; i++)
{
    newTeam = 0
    if (sockets >= 2)
        newTeam = ds_list_find_value(newTeamList, i)
    if (!global.saxmode)
        newTeam = 1
    buffer_delete(buffer)
    size = 1024
    type = buffer_grow
    alignment = 1
    buffer = buffer_create(size, type, alignment)
    buffer_seek(buffer, buffer_seek_start, 0)
    buffer_write(buffer, buffer_u8, 112)
    buffer_write(buffer, buffer_u8, global.saxmode)
    buffer_write(buffer, buffer_u8, newTeam)
    bufferSize = buffer_tell(buffer)
    buffer_seek(buffer, buffer_seek_start, 0)
    buffer_write(buffer, buffer_s32, bufferSize)
    buffer_write(buffer, buffer_u8, 112)
    buffer_write(buffer, buffer_u8, global.saxmode)
    buffer_write(buffer, buffer_u8, newTeam)
    network_send_packet(ds_list_find_value(playerList, i), buffer, buffer_tell(buffer))
    f = 0
    while (f < ds_list_size(idList))
    {
        arrList = ds_list_find_value(idList, f)
        if (arrList[0, 1] == ds_list_find_value(playerList, i))
        {
            if (newTeam == 1)
            {
                findIDSAX = ds_list_find_index(saxList, arrList[0, 0])
                if (findIDSAX >= 0)
                {
                    ds_list_delete(saxList, findIDSAX)
                    ds_list_add(samusList, arrList[0, 0])
                    break
                }
                else if (newTeam == 2)
                {
                    findIDSamus = ds_list_find_index(samusList, arrList[0, 0])
                    if (findIDSamus >= 0)
                    {
                        ds_list_delete(samusList, findIDSamus)
                        ds_list_add(saxList, arrList[0, 0])
                        break
                    }
                    else
                    {
                        f++
                        continue
                    }
                }
                else
                {
                    f++
                    continue
                }
            }
            else if (newTeam == 2)
            {
                findIDSamus = ds_list_find_index(samusList, arrList[0, 0])
                if (findIDSamus >= 0)
                {
                    ds_list_delete(samusList, findIDSamus)
                    ds_list_add(saxList, arrList[0, 0])
                    break
                }
                else
                {
                    f++
                    continue
                }
            }
            else
            {
                f++
                continue
            }
        }
        else
        {
            f++
            continue
        }
    }
}
ds_list_destroy(newTeamList)
