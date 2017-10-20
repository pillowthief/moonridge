function updateKeys()
  if love.keyboard.isDown( "up" ) then
    conversation:say('pressed up')
  end

  if love.keyboard.isDown( "down" ) then
    conversation:say('pressed down')
  end

  if love.keyboard.isDown( "right" ) then
    conversation:say('pressed right')
  end

  if love.keyboard.isDown( "left" ) then
    conversation:say('pressed left')
  end

  if love.keyboard.isDown ( "escape" ) then
    conversation:say('pressed escape')
  end

  if love.keyboard.isDown ( "delete" ) then
    conversation:say('pressed delete')
  end

  function love.keyreleased( key )
   if key == "`" then
      conversation:say('pressed tilde')
   end
  end

end
