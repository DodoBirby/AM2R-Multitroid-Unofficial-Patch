var findID, i, arrDraw, arrID, arrX, arrY, arrSprite, arrRoom, arrState;
if (myid != 0)
{
    depth = -12
    if instance_exists(oClient)
    {
        findID = ds_list_find_index(global.screwList, myid)
        if (findID >= 0)
        {
            if (ds_list_size(oClient.roomListData) > 0)
            {
                for (i = 0; i < ds_list_size(oClient.roomListData); i++)
                {
                    arrDraw = ds_list_find_value(oClient.roomListData, i)
                    arrID = arrDraw[0]
                    arrX = arrDraw[1]
                    arrY = arrDraw[2]
                    arrSprite = arrDraw[3]
                    mirror = arrDraw[12]
                    arrRoom = arrDraw[14]
                    arrState = arrDraw[19]
                    if (arrID == myid)
                    {
                        x = arrX
                        y = arrY
                        if (arrRoom != room)
                            instance_destroy()
                    }
                }
            }
        }
        else
            instance_destroy()
    }
    else
        instance_destroy()
}
fxtimer++
if (fxtimer > 4)
    fxtimer = 0
