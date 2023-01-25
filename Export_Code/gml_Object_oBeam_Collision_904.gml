if (sax != other.sax && (!other.spectator))
{
    if pbeam
    {
        event_user(0)
        global.checkID = other.myid
        global.checkX = other.x
        global.checkY = other.y
        global.checkBeam = 1
        global.checkMissile = 0
        global.checkDamage = damage
        global.checkFreeze = 0
        if ibeam
            global.checkFreeze = 1
        if (myid == 0)
        {
            with (oClient)
                event_user(3)
        }
    }
    else
    {
        event_user(0)
        global.checkID = other.myid
        global.checkX = other.x
        global.checkY = other.y
        global.checkBeam = 1
        global.checkMissile = 0
        global.checkDamage = damage
        global.checkFreeze = 0
        if ibeam
            global.checkFreeze = 1
        if (myid == 0)
        {
            with (oClient)
                event_user(3)
        }
        instance_destroy()
    }
}
