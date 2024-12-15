return function(Player: string)
  if game:GetService("Players"):FindFirstChild(Player) == nil then
        return string.format("Player %s is not a valid player. (ERR:PLAYER-NOT-FOUND)", Player)
    end

    return game:GetService("Players")[Player].CameraMaxZoomDistance
end
