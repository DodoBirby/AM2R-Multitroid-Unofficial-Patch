var ID, input;
ID = ds_map_find_value(async_load, "id")
if (ID == msg)
{
    if ds_map_find_value(async_load, "status")
    {
        input = ds_map_find_value(async_load, "value")
        if is_real(input)
        {
            random_set_seed(input)
            global.seed = input
            if (global.seed == 0)
                scr_default_global_items()
            else
            {
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
        }
    }
}
