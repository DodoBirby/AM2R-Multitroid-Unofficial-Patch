var slotStr;
if (oLoad.alarm[0] < 0 && oSave.alarm[0] < 0 && oLoad.alarm[1] < 0)
{
    global.slot++
    if (global.slot > 3)
        global.slot = 1
    slotStr = string(global.slot)
    global.saveString = (("\save" + slotStr) + ".txt")
}
