///t_set(Stat, Value);
if room != room_ingame{
    println("You are not in game");
}else{
    if argument0 == "lives"{
        if real(argument1) >= 0 && real(argument1) <= 8{
            global.life = real(argument1);
            println("Lives set to " + argument1);
        }else{
            println("Please input a number between 0 and 8");
        }
    }
    
    else if argument0 == "bombs"{
        if real(argument1) >= 0 && real(argument1) <= 8{
            global.bombs = real(argument1);
            println("Bombs set to " + argument1);
        }else{
            println("Please input a number between 0 and 8");
        }
    }
    
    else if argument0 == "power"{
        if real(argument1) >= 1 && real(argument1) <= global.max_power{
            global.pow = real(argument1);
            println("Power set to " + argument1);
        }else{
            println("Please input a number between 1 and " + string(global.max_power));
        }
    }
    
    else if argument0 == "sec"{
        if real(argument1) >= 1 && real(argument1) <= 10000{
            global.seconds = real(argument1);
            println("Global.seconds variable set to " + argument1);
        }else{
            println("Please input a number between 1 and 10000");
        }
    }
    
    else if argument0 == ""{
        println("set: missing operand");
    }
    
    else{
        println("set: '" + exec[1] + "' invalid operand");
    }
}