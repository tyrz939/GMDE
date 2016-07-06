///number_add_comma(string);
 
if (is_real(argument0)){
    var str=string(argument0);
}else{
    var str=argument0;
}
 
for (var i=string_length(str)-2; i>1; i-=3){
    str=string_insert(",",str,i);
}
return str;