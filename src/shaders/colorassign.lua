ColorAssign = love.graphics.newShader[[
  extern vec4 bgcolor;
  extern vec4 fgcolor;

  vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
    vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
    if (pixel.a == 0.0) { return vec4(bgcolor.r/255,bgcolor.g/255,bgcolor.b/255,bgcolor.a/255); }
    else { return vec4(fgcolor.r/255,fgcolor.g/255,fgcolor.b/255,fgcolor.a/255); }
    return pixel;
  }
]]
