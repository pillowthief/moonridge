SimpleColorAssign = love.graphics.newShader[[
  extern vec4 bgcolor;
  extern vec4 fgcolor;

  vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
    vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
    if (pixel.a == 0.0) { return vec4(bgcolor.r/255,bgcolor.g/255,bgcolor.b/255,bgcolor.a/255); }
    else { return vec4(fgcolor.r/255,fgcolor.g/255,fgcolor.b/255,fgcolor.a/255); }
    return pixel;
  }
]]

FullColorAssign = love.graphics.newShader[[
  extern vec4 color1;
  extern vec4 color2;
  extern vec4 color3;
  extern vec4 color4;

  vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
    vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
    if (pixel.a == 0.0) { return vec4(0.0,0.0,0.0,0.0); }
    else if (pixel.r * 255 == 255) {return vec4(color1.r/255,color1.g/255,color1.b/255,color1.a/255);}
    else if (pixel.r * 255 == 178) {return vec4(color2.r/255,color2.g/255,color2.b/255,color2.a/255);}
    else if (pixel.r * 255 == 102) {return vec4(color3.r/255,color3.g/255,color3.b/255,color3.a/255);}
    else if (pixel.r * 255 == 51) {return vec4(color4.r/255,color4.g/255,color4.b/255,color4.a/255);}
    else { return vec4(0.0,0.0,0.0,255); }
    return pixel;
  }
]]
