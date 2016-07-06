///t_debug(On/Off);
if argument0 == "on"{
    show_debug_overlay(true);
    global.debug = true;
    println("debug mode ON");
}
else if argument0 == "off"{
    show_debug_overlay(false);
    global.debug = false;
    println("debug mode OFF");
}

else if argument0 == ""{
    println("debug: missing operand");
}

else{
    println("debug: '" + exec[1] + "' invalid operand");
}