i = x - prev_x;
if i >= 1
    {
    if image_index <4 {image_index = 4;}
    image_xscale = 1;
    }
else if i <= -1
    {
    if image_index <4 {image_index = 4;}
    image_xscale = -1;
    }
else
    {
    if image_index >3 {image_index = 0;}
    image_xscale = 1;
    }

prev_x = x;