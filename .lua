local humanoid = Players.LocalPlayer.Humanoid
if humanoid.Touched:Connect(hit)
  humanoid.Health = 0
  end
