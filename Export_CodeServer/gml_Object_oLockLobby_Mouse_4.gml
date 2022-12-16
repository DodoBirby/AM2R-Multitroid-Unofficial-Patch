global.lobbyLocked = (!global.lobbyLocked)
if global.lobbyLocked
{
    if (global.doomtime >= 0)
    {
        global.gametime = ((global.doomtime * 60) * 60)
        global.doomenabled = 1
    }
    else
    {
        global.doomenabled = 0
        global.gametime = 0
    }
}
