function menuKeyMgr()

mListener = conversation:listen('pressed escape', function()
  ScreenManager.pop()
end)

end
