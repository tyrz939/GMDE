///t_inst(Sub Command);
if argument0 == "count"{
    println("current instance count = " + string(instance_count));
}

else if argument0 == ""{
    println("inst: missing operand");
}

else{
    println("inst: '" + exec[1] + "' invalid operand");
}