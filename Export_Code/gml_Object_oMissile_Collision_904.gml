if (myid != other.myid && sax != other.sax && (!other.spectator))
{
    global.checkID = other.myid
    global.checkX = other.x
    global.checkY = other.y
    global.checkBeam = 0
    global.checkMissile = 1
    global.checkDamage = damage
    global.checkFreeze = 0
    if icemissiles
        global.checkFreeze = 1
    if (myid == 0)
    {
        with (oClient)
            event_user(3)
    }
    event_user(0)
}
