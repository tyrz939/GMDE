if global.pause==0 || blur_start==true{
blur_start=false;//Stops a crash if spawned on the same frame you pause
if start1==true
    {
    start1=false;
    for(i=0;i<12;i+=1)
        {
        trail[i,0]=-10;
        trail[i,1]=-10;
        }
    }

trail[0,0]=round(xprevious);
trail[0,1]=round(yprevious);
for(i=12;i>0;i-=1)
    {
    move0=trail[i-1,0];
    trail[(i),0]=move0;
    move1=trail[i-1,1];
    trail[(i),1]=move1;
    }
}

alpha=0.1;
for(i=0;i<12;i+=3)
    {
    draw_sprite_ext(sprite_index,image_index,trail[i,0],trail[i,1],image_xscale,image_yscale,image_angle,image_blend,alpha);
    alpha-=0.01;
    }