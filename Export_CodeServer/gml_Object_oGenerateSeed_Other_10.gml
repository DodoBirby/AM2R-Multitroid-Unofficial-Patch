if instance_exists(oServer)
{
    global.seed = random_get_seed()
    alarm[0] = 120
    switch global.rando
    {
        case 0:
            scr_randomizer()
            break
        case 1:
            scr_randomizer_pure()
            break
        case 2:
            scr_rand_split_powerups()
            break
        case 3:
            scr_randomizer_split_items()
            break
    }

    oServer.alarm[10] = 30
}
