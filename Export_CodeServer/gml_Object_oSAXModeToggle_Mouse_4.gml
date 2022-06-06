if instance_exists(oServer)
{
    global.saxmode = (!global.saxmode)
    with (oServer)
        event_user(4)
}
else
    global.saxmode = 0
