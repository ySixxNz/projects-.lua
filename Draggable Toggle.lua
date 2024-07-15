  local GUI = Instance.new("ScreenGui")
  GUI.Parent = game.CoreGui
  GUI.Name = "ToggleGUI"
  
  local ToggleButton = Instance.new("ImageButton")
  ToggleButton.Size = UDim2.new()
  ToggleButton.Position = UDim2.new(35, 35)
  ToggleButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
  ToggleButton.Image = "rbxassetid://18503887946"
  ToggleButton.Parent = GUI
  
  local UICorner = Instance.new("UICorner")
  UICorner.CornerRadius = UDim.new(0.1, 0)
  UICorner.Parent = ToggleButton
  
  local UIS = game:GetService("UserInputService")
  local dragging
  local dragInput
  local dragStart
  local startPos
  
  local function update(input)
      local delta = input.Position - dragStart
      ToggleButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
  end
  
  ToggleButton.InputBegan:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
          dragging = true
          dragStart = input.Position
          startPos = ToggleButton.Position
  
          input.Changed:Connect(function()
              if input.UserInputState == Enum.UserInputState.End then
                  dragging = false
              end
          end)
      end
  end)
  
  ToggleButton.InputChanged:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
          dragInput = input
      end
  end)
  
  UIS.InputChanged:Connect(function(input)
      if input == dragInput and dragging then
          update(input)
      end
  end)
  
  ToggleButton.MouseButton1Click:Connect(function()
      OrionLib:Switch()
  end)