local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass("Terrain")
local camera = workspace.CurrentCamera

local function workspace()
	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj:IsA("Decal") or obj:IsA("Texture") or obj:IsA("SurfaceGui") or obj:IsA("BillboardGui") then
			obj:Destroy()
		elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") or obj:IsA("Beam") then
			obj:Destroy()
		elseif obj:IsA("BasePart") then
			if obj.Transparency == 1 and not obj.CanCollide then
				obj:Destroy()
			else
				obj.Material = Enum.Material.SmoothPlastic
				for _, child in ipairs(obj:GetChildren()) do
					if child:IsA("SpecialMesh") or child:IsA("Mesh") then
						child:Destroy()
					end
				end
			end
		end
	end
end

local function lighting()
	Lighting.GlobalShadows = false
	Lighting.FogEnd = 1e6
	Lighting.FogStart = 0
	Lighting.Brightness = 1
	Lighting.EnvironmentDiffuseScale = 0
	Lighting.EnvironmentSpecularScale = 0
	Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
	Lighting.Ambient = Color3.fromRGB(128, 128, 128)
	Lighting.ClockTime = 14
	Lighting.GeographicLatitude = 0
	Lighting.ExposureCompensation = 0
end

local function cameraEffects()
	for _, v in ipairs(camera:GetChildren()) do
		if v:IsA("PostEffect") then
			v.Enabled = false
		end
	end
end

local function terrain()
	if Terrain then
		Terrain.Decorations = false
		Terrain.WaterTransparency = 1
		Terrain.WaterWaveSize = 0
		Terrain.WaterWaveSpeed = 0
		Terrain.WaterReflectance = 0
		Terrain.WaterColor = Color3.fromRGB(128, 128, 128)
	end
end

local function quality()
	settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
end

local function ui()
	for _, ui in ipairs(game:GetDescendants()) do
		if ui:IsA("ImageLabel") or ui:IsA("ImageButton") then
			ui.ImageTransparency = 0
		elseif ui:IsA("TextLabel") or ui:IsA("TextButton") or ui:IsA("TextBox") then
			ui.TextStrokeTransparency = 1
			ui.TextScaled = true
		end
	end
end

workspace()
lighting()
cameraEffects()
terrain()
quality()
ui()
