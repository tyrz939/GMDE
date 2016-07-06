attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_texcoord;
varying vec4 v_color;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_color = in_Colour;
    v_texcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_texcoord;
varying vec4 v_color;

uniform vec2 center;
uniform vec2 resolution;

float circleRadius = float(0.25);
float minZoom = 0.4;
float maxZoom = 0.6;

void main()
{
  vec2 uv = v_texcoord;  
  uv.x *= (resolution.x/resolution.y);
  
  vec2 aspect_center = vec2(0.0, 0.0);
  aspect_center.x = (center.x / resolution.x) * (resolution.x/resolution.y);
  aspect_center.y = center.y / resolution.y;
  
float maxX = aspect_center.x + circleRadius;
float minX = aspect_center.x - circleRadius;
float maxY = aspect_center.y + circleRadius;
float minY = aspect_center.y - circleRadius;

if( uv.x > minX && uv.x < maxX && uv.y > minY && uv.y < maxY)
{
    float relX = uv.x - aspect_center.x;
    float relY = uv.y - aspect_center.y;
    float ang =  atan(relY, relX);
    float dist = sqrt(relX*relX + relY*relY);
    
    if( dist <= circleRadius )
    {
        float newRad = dist * ( (maxZoom * dist/circleRadius) + minZoom );
        float newX = aspect_center.x + cos( ang ) * newRad;
        newX *= (resolution.y/resolution.x);
        float newY = aspect_center.y + sin( ang ) * newRad;
        gl_FragColor = texture2D(gm_BaseTexture, vec2(newX, newY) );
    }
    else
    {
        gl_FragColor = texture2D(gm_BaseTexture, v_texcoord);
    }
}
else
    {
        gl_FragColor = gl_FragColor = texture2D(gm_BaseTexture, v_texcoord);
    }  
}
