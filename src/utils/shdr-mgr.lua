local shine = require 'lib/shine'

function addShaderEffects()
  local vignette = shine.vignette()
  vignette.parameters = {radius = 0.9, opacity = 0.5}

  post_effect = vignette
  post_effect.opacity = 0.5
end
