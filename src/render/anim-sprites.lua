local masc_char = love.graphics.newImage 'assets/chars/masc_char.png'
local fem_char = love.graphics.newImage 'assets/chars/fem_char.png'

mascCharSprite = sodapop.newAnimatedSprite(16, 16)
mascCharSprite:addAnimation('walkDown', {
  image        = masc_char,
  frameWidth   = 32,
  frameHeight  = 32,
  onReachedEnd = function() mascCharSprite:switch 'standDown' end,
  frames       = {
    {1, 1, 3, 1, .1},
  },
})

mascCharSprite:addAnimation('standDown', {
  image        = masc_char,
  frameWidth   = 32,
  frameHeight  = 32,
  frames       = {
    {2, 1, 2, 1, 1},
  },
})

mascCharSprite:addAnimation('walkRight', {
  image        = masc_char,
  frameWidth   = 32,
  frameHeight  = 32,
  onReachedEnd = function() mascCharSprite:switch 'standRight' end,
  frames       = {
    {1, 3, 3, 3, .1},
  },
})

mascCharSprite:addAnimation('standRight', {
  image        = masc_char,
  frameWidth   = 32,
  frameHeight  = 32,
  frames       = {
    {2, 3, 2, 3, 1},
  },
})

mascCharSprite:addAnimation('walkLeft', {
  image        = masc_char,
  frameWidth   = 32,
  frameHeight  = 32,
  onReachedEnd = function() mascCharSprite:switch 'standLeft' end,
  frames       = {
    {1, 2, 3, 2, .1},
  },
})

mascCharSprite:addAnimation('standLeft', {
  image        = masc_char,
  frameWidth   = 32,
  frameHeight  = 32,
  frames       = {
    {2, 2, 2, 2, 1},
  },
})

mascCharSprite:addAnimation('walkUp', {
  image        = masc_char,
  frameWidth   = 32,
  frameHeight  = 32,
  onReachedEnd = function() mascCharSprite:switch 'standUp' end,
  frames       = {
    {1, 4, 3, 4, .1},
  },
})

mascCharSprite:addAnimation('standUp', {
  image        = masc_char,
  frameWidth   = 32,
  frameHeight  = 32,
  frames       = {
    {2, 4, 2, 4, 1},
  },
})



femCharSprite = sodapop.newAnimatedSprite(16, 16)
femCharSprite:addAnimation('walkDown', {
  image        = fem_char,
  frameWidth   = 32,
  frameHeight  = 32,
  onReachedEnd = function() femCharSprite:switch 'standDown' end,
  frames       = {
    {1, 1, 3, 1, .1},
  },
})

femCharSprite:addAnimation('standDown', {
  image        = fem_char,
  frameWidth   = 32,
  frameHeight  = 32,
  frames       = {
    {2, 1, 2, 1, 1},
  },
})

femCharSprite:addAnimation('walkRight', {
  image        = fem_char,
  frameWidth   = 32,
  frameHeight  = 32,
  onReachedEnd = function() femCharSprite:switch 'standRight' end,
  frames       = {
    {1, 3, 3, 3, .1},
  },
})

femCharSprite:addAnimation('standRight', {
  image        = fem_char,
  frameWidth   = 32,
  frameHeight  = 32,
  frames       = {
    {2, 3, 2, 3, 1},
  },
})

femCharSprite:addAnimation('walkLeft', {
  image        = fem_char,
  frameWidth   = 32,
  frameHeight  = 32,
  onReachedEnd = function() femCharSprite:switch 'standLeft' end,
  frames       = {
    {1, 2, 3, 2, .1},
  },
})

femCharSprite:addAnimation('standLeft', {
  image        = fem_char,
  frameWidth   = 32,
  frameHeight  = 32,
  frames       = {
    {2, 2, 2, 2, 1},
  },
})

femCharSprite:addAnimation('walkUp', {
  image        = fem_char,
  frameWidth   = 32,
  frameHeight  = 32,
  onReachedEnd = function() femCharSprite:switch 'standUp' end,
  frames       = {
    {1, 4, 3, 4, .1},
  },
})

femCharSprite:addAnimation('standUp', {
  image        = fem_char,
  frameWidth   = 32,
  frameHeight  = 32,
  frames       = {
    {2, 4, 2, 4, 1},
  },
})
