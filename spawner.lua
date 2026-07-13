-- Royale High Client-Side Spawner, Server Scanner & Part Customizer (Antigravity Universal Edition)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ─── SECURITY ACCESS REMOTE WHITELIST ───
-- Checks if the user's Roblox UserId is registered in your online database/JSON file!
local HttpService = game:GetService("HttpService")
local whitelistUrl = "https://raw.githubusercontent.com/GunFame/GunFamesRHHalos/main/Havenwait.json?nocache=" .. tostring(math.random(1, 999999))

local function isWhitelisted()
    local myId = player.UserId
    
    -- Bypass check for developer
    if myId == 327429188 then 
        return true
    end
    
    local success, response = pcall(function()
        return game:HttpGet(whitelistUrl)
    end)
    
    if success and response and #response > 0 then
        local ids = nil
        pcall(function()
            ids = HttpService:JSONDecode(response)
        end)
        
        if ids then
            for _, id in ipairs(ids) do
                if tonumber(id) == myId then
                    return true
                end
            end
        end
    end
    return false
end

local verified = false
task.spawn(function()
    verified = isWhitelisted()
end)

-- Yield briefly for connection check
local checkCount = 0
while not verified and checkCount < 6 do
    task.wait(0.5)
    checkCount = checkCount + 1
end

if not verified then
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "SecurityLockGui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 340, 0, 220)
    mainFrame.Position = UDim2.new(0.5, -170, 0.4, -110)
    mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    
    local bgGradient = Instance.new("UIGradient")
    bgGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 20)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(28, 18, 38))
    })
    bgGradient.Rotation = 45
    bgGradient.Parent = mainFrame
    
    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 10)
    mainCorner.Parent = mainFrame
    
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(255, 255, 255)
    stroke.Parent = mainFrame
    
    local strokeGradient = Instance.new("UIGradient")
    strokeGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 60, 150)), -- Hot Pink
        ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 50, 255))  -- Purple
    })
    strokeGradient.Rotation = 45
    strokeGradient.Parent = stroke
    
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -30, 0, 0)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 14
    closeBtn.Parent = mainFrame
    
    local closeGradient = Instance.new("UIGradient")
    closeGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 60, 150)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 50, 255))
    })
    closeGradient.Parent = closeBtn
    
    closeBtn.MouseButton1Click:Connect(function()
        player:Kick("RoyaleStock.lol Whitelist Required")
    end)
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 35)
    title.BackgroundTransparency = 1
    title.Text = "ACCESS DENIED"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 13
    title.Parent = mainFrame
    
    local titleGradient = Instance.new("UIGradient")
    titleGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 60, 150)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 100, 255))
    })
    titleGradient.Parent = title
    
    local desc = Instance.new("TextLabel")
    desc.Size = UDim2.new(0.9, 0, 0, 85)
    desc.Position = UDim2.new(0.05, 0, 0, 40)
    desc.BackgroundTransparency = 1
    desc.Text = "Your Roblox UserId is not whitelisted.\n\nUserId: " .. tostring(player.UserId) .. "\n\nCopy your ID and send it to RoyaleStock.lol to be whitelisted."
    desc.TextColor3 = Color3.fromRGB(200, 200, 210)
    desc.Font = Enum.Font.GothamSemibold
    desc.TextSize = 10
    desc.TextWrapped = true
    desc.Parent = mainFrame
    
    -- Action buttons row
    local btnRow = Instance.new("Frame")
    btnRow.Size = UDim2.new(0.9, 0, 0, 32)
    btnRow.Position = UDim2.new(0.05, 0, 0, 135)
    btnRow.BackgroundTransparency = 1
    btnRow.Parent = mainFrame
    
    local copyBtnBg = Instance.new("Frame")
    copyBtnBg.Size = UDim2.new(0.48, 0, 1, 0)
    copyBtnBg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    copyBtnBg.BorderSizePixel = 0
    copyBtnBg.Parent = btnRow
    
    local copyCorner = Instance.new("UICorner")
    copyCorner.CornerRadius = UDim.new(0, 6)
    copyCorner.Parent = copyBtnBg
    
    local copyGradient = Instance.new("UIGradient")
    copyGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 60, 150)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 50, 255))
    })
    copyGradient.Parent = copyBtnBg
    
    local copyBtn = Instance.new("TextButton")
    copyBtn.Size = UDim2.new(1, 0, 1, 0)
    copyBtn.BackgroundTransparency = 1
    copyBtn.Text = "Copy Roblox ID"
    copyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    copyBtn.Font = Enum.Font.GothamBold
    copyBtn.TextSize = 10
    copyBtn.Parent = copyBtnBg
    
    local discordBtnBg = Instance.new("Frame")
    discordBtnBg.Size = UDim2.new(0.48, 0, 1, 0)
    discordBtnBg.Position = UDim2.new(0.52, 0, 0, 0)
    discordBtnBg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    discordBtnBg.BorderSizePixel = 0
    discordBtnBg.Parent = btnRow
    
    local discordCorner = Instance.new("UICorner")
    discordCorner.CornerRadius = UDim.new(0, 6)
    discordCorner.Parent = discordBtnBg
    
    local discordGradient = Instance.new("UIGradient")
    discordGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(114, 137, 218)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(88, 101, 242))
    })
    discordGradient.Parent = discordBtnBg
    
    local discordBtn = Instance.new("TextButton")
    discordBtn.Size = UDim2.new(1, 0, 1, 0)
    discordBtn.BackgroundTransparency = 1
    discordBtn.Text = "Copy Discord"
    discordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    discordBtn.Font = Enum.Font.GothamBold
    discordBtn.TextSize = 10
    discordBtn.Parent = discordBtnBg
    
    -- Sub footer text for Discord link display
    local footer = Instance.new("TextLabel")
    footer.Size = UDim2.new(1, 0, 0, 20)
    footer.Position = UDim2.new(0, 0, 0, 180)
    footer.BackgroundTransparency = 1
    footer.Text = "discord.gg/XqWA5eswJk"
    footer.TextColor3 = Color3.fromRGB(120, 120, 140)
    footer.Font = Enum.Font.Code
    footer.TextSize = 9
    footer.Parent = mainFrame
    
    copyBtn.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(tostring(player.UserId))
            copyBtn.Text = "Copied ID!"
            task.wait(1.5)
            copyBtn.Text = "Copy Roblox ID"
        else
            copyBtn.Text = "No Clipboard!"
        end
    end)
    
    discordBtn.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard("https://discord.gg/XqWA5eswJk")
            discordBtn.Text = "Copied Link!"
            task.wait(1.5)
            discordBtn.Text = "Copy Discord"
        else
            discordBtn.Text = "No Clipboard!"
        end
    end)
    
    -- Block thread permanently
    while true do
        task.wait(1.0)
    end
end

-- Global Cache and Config (Only loads if whitelisted)
getgenv().RequestedFakeItems = getgenv().RequestedFakeItems or {}
getgenv().LoadedHaloCache = getgenv().LoadedHaloCache or {} -- Offline models cache
getgenv().ScannedServerHalos = getgenv().ScannedServerHalos or {} -- Models grabbed from other players
getgenv().HaloHeightOffset = 0
getgenv().HaloScaleMultiplier = 1.0

local currentHaloModel = nil
local activeAnimConn = nil
local originalWeldSizes = {}
local selectedPartToColor = nil

-- ─── STEP 1: HALO DATABASE ───
local halos = {
    {short = "winter 2020", official = "Winter Halo 2020", id = "rbxassetid://6028845861"},
    {short = "everfriend 2024", official = "Divine Adoration 💛 Everfriend Halo 2024", id = "rbxassetid://16113190763"},
    {short = "halloween 2020", official = "Halloween Halo 2020", id = "rbxassetid://5812685640"},
    {short = "winter 2019", official = "Winter Halo 2019", id = "rbxassetid://4501088914"},
    {short = "spring 2020", official = "Spring Halo 2020", id = "rbxassetid://4957139301"},
    {short = "glitterfrost 2023", official = "Frosty Fortitude 🩵 Glitterfrost Halo 2023", id = "rbxassetid://15418042780"},
    {short = "crystal heart", official = "Crystal Heart 💝 Throne Halo", id = "rbxassetid://93759035525542"},
    {short = "throne halo", official = "Crystal Heart 💝 Throne Halo", id = "rbxassetid://93759035525542"},
    {short = "valentines 2021", official = "Valentines Halo 2021", id = "rbxassetid://6289545706"},
    {short = "lucky 2021", official = "Lucky Halo 2021", id = "rbxassetid://6479631004"},
    {short = "everfriend 2026", official = "Eternity's Aim Halo 🏹 Everfriend 2026", id = "rbxassetid://99669755697377"},
    {short = "eternity aim", official = "Eternity's Aim Halo 🏹 Everfriend 2026", id = "rbxassetid://99669755697377"},
    {short = "winter 2022", official = "Winter Halo 2022", id = "rbxassetid://11701160386"},
    {short = "entwined vines", official = "Entwined Vines 💚 Flowering Halo 2024", id = "rbxassetid://16966217172", synonyms = {"entwined", "vines"}},
    {short = "winter 2021", official = "Winter Halo 2021", id = "rbxassetid://8145602687"},
    {short = "valentines 2019", official = "Valentines Halo 2019", id = "rbxassetid://2807591119"},
    {short = "mermaid 2021", official = "Mermaid Halo 2021", id = "rbxassetid://6967735253"},
    {short = "everfriend 2025", official = "Harmonic Hearts 💝 Everfriend Halo & Wand 2025", id = "rbxassetid://113199186870059"},
    {short = "harmonic hearts", official = "Harmonic Hearts 💝 Everfriend Halo & Wand 2025", id = "rbxassetid://113199186870059"},
    {short = "flowering 2026", official = "Frolicking Fields Halo 🪻 Flowering 2026", id = "rbxassetid://104637554842874"},
    {short = "frolicking fields", official = "Frolicking Fields Halo 🪻 Flowering 2026", id = "rbxassetid://104637554842874"},
    {short = "winter 2018", official = "Winter Crystal Halo 2018", id = "rbxassetid://2611120533"},
    {short = "angel halo", official = "Angel Halo", id = "rbxassetid://6128358004"},
    {short = "tidalglow 2025", official = "Luminous Lagoon 🐠 Tidalglow Halo 2025", id = "rbxassetid://122528220847482"},
    {short = "luminous lagoon", official = "Luminous Lagoon 🐠 Tidalglow Halo 2025", id = "rbxassetid://122528220847482"},
    {short = "eveningfall 2025", official = "Silk Spun Halo 🕸️ Eveningfall 2025", id = "rbxassetid://117242240826038"},
    {short = "silk spun", official = "Silk Spun Halo 🕸️ Eveningfall 2025", id = "rbxassetid://117242240826038"},
    {short = "valentines 2020", official = "Valentines Halo 2020", id = "rbxassetid://4687458906"},
    {short = "corrupt halo", official = "Corrupt Halo", id = "rbxassetid://2342898583"},
    {short = "eveningfall 2024", official = "Dream Dust 🌟 Eveningfall Halo 2024", id = "rbxassetid://111594977616534"},
    {short = "dream dust", official = "Dream Dust 🌟 Eveningfall Halo 2024", id = "rbxassetid://111594977616534"},
    {short = "light halo", official = "Glimmering Light Halo", id = "rbxassetid://2342893025"},
    {short = "glimmering", official = "Glimmering Light Halo", id = "rbxassetid://2342893025"},
    {short = "glitterfrost 2025", official = "Wishing Star Woods Halo 🌲 Glitterfrost 2025", id = "rbxassetid://126225645930600"},
    {short = "wishing star", official = "Wishing Star Woods Halo 🌲 Glitterfrost 2025", id = "rbxassetid://126225645930600"},
    {short = "spring 2022", official = "Spring Halo 2022", id = "rbxassetid://8694237780"},
    {short = "easter 2019", official = "Easter Halo 2019", id = "rbxassetid://3028596202"},
    {short = "lucky 2020", official = "Lucky Halo 2020", id = "rbxassetid://4791351335"},
    {short = "autumn 2019", official = "Autumn Halo 2019", id = "rbxassetid://4266681961"},
    {short = "enchantraverse", official = "Crown of the Realms 🪽 Enchantraverse Halo", id = "rbxassetid://13514244584674"},
    {short = "lucky 2019", official = "Lucky Halo 2019", id = "rbxassetid://2925342750"}
}

-- ─── STEP 2: AUTOCORRECT SPELL VALIDATOR ───
local function cleanString(str)
    local s = str:lower()
    s = s:gsub("valentines", "val"):gsub("valentine", "val"):gsub("halloween", "hal")
    s = s:gsub("glimmering", "light"):gsub("halo", ""):gsub("halos", "")
    s = s:gsub("%s+", ""):gsub("[^%w]", "")
    return s
end

local function getLevenshteinDistance(str1, str2)
    local len1, len2 = #str1, #str2
    local matrix = {}
    for i = 0, len1 do matrix[i] = {[0] = i} end
    for j = 0, len2 do matrix[0][j] = j end
    for i = 1, len1 do
        local c1 = str1:sub(i, i)
        for j = 1, len2 do
            local c2 = str2:sub(j, j)
            local cost = (c1 == c2) and 0 or 1
            matrix[i][j] = math.min(
                matrix[i - 1][j] + 1,
                matrix[i][j - 1] + 1,
                matrix[i - 1][j - 1] + cost
            )
        end
    end
    return matrix[len1][len2]
end

local function findBestHaloMatch(nameInput)
    local cleanInput = cleanString(nameInput)
    if cleanInput == "" then return nil end
    for _, halo in ipairs(halos) do
        local cleanShort = cleanString(halo.short)
        if cleanShort:find(cleanInput, 1, true) or cleanInput:find(cleanShort, 1, true) then
            return halo
        end
    end
    local bestMatch = nil
    local bestScore = 999
    for _, halo in ipairs(halos) do
        local cleanShort = cleanString(halo.short)
        local dist = getLevenshteinDistance(cleanInput, cleanShort)
        local score = dist / math.max(#cleanInput, #cleanShort)
        if score < bestScore then
            bestScore = score
            bestMatch = halo
        end
    end
    if bestScore < 0.4 then return bestMatch end
    return nil
end

-- ─── STEP 3: DYNAMIC SCALING MATH ───
local function cacheOriginalSizes(model)
    originalWeldSizes = {}
    for _, desc in ipairs(model:GetDescendants()) do
        if desc:IsA("BasePart") then
            originalWeldSizes[desc] = {
                size = desc.Size,
                meshScale = desc:FindFirstChildOfClass("SpecialMesh") and desc:FindFirstChildOfClass("SpecialMesh").Scale or nil
            }
        elseif desc:IsA("Weld") or desc:IsA("Motor6D") or desc:IsA("ManualWeld") then
            originalWeldSizes[desc] = {
                c0 = desc.C0,
                c1 = desc.C1
            }
        end
    end
end

local function applyScaleMultiplier(multiplier)
    if not currentHaloModel then return end
    for obj, data in pairs(originalWeldSizes) do
        if obj.Parent then
            if obj:IsA("BasePart") then
                pcall(function()
                    obj.Size = data.size * multiplier
                    local mesh = obj:FindFirstChildOfClass("SpecialMesh")
                    if mesh and data.meshScale then
                        mesh.Scale = data.meshScale * multiplier
                    end
                end)
            elseif (obj:IsA("Weld") or obj:IsA("Motor6D") or obj:IsA("ManualWeld")) and obj.Name ~= "AccessoryWeld" then
                pcall(function()
                    obj.C0 = CFrame.new(data.c0.Position * multiplier) * (data.c0 - data.c0.Position)
                    obj.C1 = CFrame.new(data.c1.Position * multiplier) * (data.c1 - data.c1.Position)
                end)
            end
        end
    end
end

-- ─── STEP 4: SERVER & GAME SEARCHER (NO LOCAL FILES FALLBACK) ───
local function scanServerForHaloModels(updateStatusBarCallback)
    if updateStatusBarCallback then updateStatusBarCallback("Status: Scanning players for halos...") end
    print("--- [Antigravity Server Scan Start] ---")
    local grabCount = 0
    
    local EquippedStorage = workspace:FindFirstChild("EquippedStorage")
    local Accessories = EquippedStorage and EquippedStorage:FindFirstChild("Accessories")
    
    if Accessories then
        for _, playerFolder in ipairs(Accessories:GetChildren()) do
            if playerFolder.Name ~= player.Name then
                for _, acc in ipairs(playerFolder:GetChildren()) do
                    local cleanAccName = cleanString(acc.Name)
                    if cleanAccName:find("halo") or cleanAccName:find("everfriend") or cleanAccName:find("glitterfrost") or cleanAccName:find("tidalglow") then
                        print("[GRABBED MODEL] Saved 3D asset of halo: " .. acc.Name .. " from player: " .. playerFolder.Name)
                        getgenv().ScannedServerHalos[cleanAccName] = acc:Clone()
                        grabCount = grabCount + 1
                    end
                end
            end
        end
    end
    
    -- Also run a fast GUI scanner to extract any missing images/icons
    local guiCount = 0
    for _, desc in ipairs(playerGui:GetDescendants()) do
        pcall(function()
            if desc:IsA("ImageLabel") or desc:IsA("ImageButton") then
                local img = tostring(desc.Image)
                if img ~= "" and not img:find("gradient") then
                    local parent = desc.Parent
                    local text = ""
                    if parent then
                        for _, sibling in ipairs(parent:GetChildren()) do
                            if sibling:IsA("TextLabel") and sibling.Text ~= "" then
                                text = sibling.Text
                                break
                            end
                        end
                    end
                    if text ~= "" and (text:lower():find("halo") or text:lower():find("everfriend") or text:lower():find("glitterfrost") or text:lower():find("tidalglow")) then
                        local entryName = text:gsub("\n", " "):gsub("<[^>]+>", "")
                        local cleanMatch = cleanString(entryName)
                        
                        local exists = false
                        for _, h in ipairs(halos) do
                            if cleanString(h.official) == cleanMatch then exists = true break end
                        end
                        if not exists then
                            table.insert(halos, {
                                short = entryName:lower(),
                                official = entryName,
                                id = img
                            })
                        end
                        guiCount = guiCount + 1
                    end
                end
            end
        end)
    end
    
    print("--- [Antigravity Scan Complete] Grabbed " .. grabCount .. " 3D models and mapped " .. guiCount .. " icons ---")
    if updateStatusBarCallback then 
        updateStatusBarCallback("Status: Scan Complete! Grabbed " .. grabCount .. " models, mapped " .. guiCount .. " icons.") 
    end
end

-- Searches ReplicatedStorage/Lighting for game templates directly (so friends without local files can load them!)
local function findHaloInGameStorage(cleanTarget)
    local searchContainers = {game:GetService("ReplicatedStorage"), game:GetService("Lighting"), game:GetService("ReplicatedFirst")}
    for _, container in ipairs(searchContainers) do
        local success, result = pcall(function()
            for _, desc in ipairs(container:GetDescendants()) do
                if desc:IsA("Accessory") or desc:IsA("Model") then
                    local cleanDescName = cleanString(desc.Name)
                    if cleanDescName == cleanTarget or cleanDescName:find(cleanTarget, 1, true) then
                        return desc:Clone()
                    end
                end
            end
        end)
        if success and result then
            return result
        end
    end
    return nil
end

-- forward declaration for color dropdown updates
local updateCustomizerPartList

-- ─── STEP 5: CLIENT-SIDE LOADER & ATTACHMENT ALIGNMENT ───
local function isGuideBodyPart(name)
    local n = name:lower()
    return n == "head" or n == "uppertorso" or n == "lowertorso" or n == "torso" 
        or n:find("arm") or n:find("leg") or n:find("hand") or n:find("foot")
        or n == "left hand" or n == "right hand"
end

local function clearClientHalo()
    if activeAnimConn then pcall(function() activeAnimConn:Disconnect() end) activeAnimConn = nil end
    if currentHaloModel then
        pcall(function() currentHaloModel:Destroy() end)
        currentHaloModel = nil
    end
    originalWeldSizes = {}
end

local function equipHalo3D(haloName)
    clearClientHalo()
    local character = player.Character or workspace:FindFirstChild(player.Name)
    if not character then return end
    local head = character:FindFirstChild("Head") or character:FindFirstChild("HumanoidRootPart")
    if not head then return end
    
    local cleanTarget = cleanString(haloName)
    local loadedModel = nil
    
    -- Option 1: Load from player cache (if someone in server has it)
    loadedModel = getgenv().ScannedServerHalos[cleanTarget]
    if loadedModel then
        loadedModel = loadedModel:Clone()
        print("[Antigravity] Spawning scanned server model: " .. haloName)
    end
    
    -- Option 2: Search game ReplicatedStorage/Lighting directories directly
    if not loadedModel then
        loadedModel = findHaloInGameStorage(cleanTarget)
        if loadedModel then
            print("[Antigravity] Found halo inside game assets: " .. haloName)
        end
    end
    
    -- Option 3: Fallback to local files (checks both .rbxmx and .rbxmx.rbxlx extensions for Wave and others)
    if not loadedModel then
        local cleanName = haloName:gsub("%s+", "_"):gsub("[^%w_]", "")
        local possibleExtensions = {
            cleanName .. ".rbxmx.rbxlx",
            cleanName .. ".rbxmx",
            cleanName .. ".rbxlx",
            cleanName:lower() .. ".rbxmx.rbxlx",
            cleanName:lower() .. ".rbxmx",
            haloName:gsub("%s+", "_") .. ".rbxmx.rbxlx",
            haloName:gsub("%s+", "_") .. ".rbxmx"
        }
        
        local validFile = nil
        if isfile then
            for _, filename in ipairs(possibleExtensions) do
                if pcall(function() return isfile(filename) end) then
                    validFile = filename
                    break
                end
            end
        end
        
        if validFile then
            pcall(function()
                local finalFile = validFile
                if validFile:lower():match("%.rbxlx$") then
                    finalFile = "temp_halo_model.rbxmx"
                    local content = readfile(validFile)
                    writefile(finalFile, content)
                end
                local assetId = getcustomasset(finalFile)
                local objs = game:GetObjects(assetId)
                if objs and objs[1] then
                    loadedModel = objs[1]
                    print("[Antigravity] Spawning local offline model: " .. validFile)
                end
            end)
        end
    end
    
    -- Option 4: Create high fidelity fallback neon ring if still missing
    if not loadedModel then
        print("[Antigravity] No model cached or found. Creating high fidelity ring.")
        local model = Instance.new("Model")
        model.Name = "ClientFakeHalo"
        model.Parent = character
        loadedModel = model
        
        local ring = Instance.new("Part")
        ring.Name = "HaloRing"
        ring.Size = Vector3.new(1.6, 0.1, 1.6)
        ring.CanCollide = false
        ring.Massless = true
        ring.Material = Enum.Material.Neon
        ring.Color = Color3.fromRGB(255, 235, 150)
        ring.Parent = model
        
        local mesh = Instance.new("SpecialMesh")
        mesh.MeshType = Enum.MeshType.FileMesh
        mesh.MeshId = "rbxassetid://327421319"
        mesh.Scale = Vector3.new(1.6, 0.4, 1.6)
        mesh.Parent = ring
    end
    
    if loadedModel then
        loadedModel.Name = "ClientFakeHalo"
        
        local mainPart = loadedModel:FindFirstChild("Head", true) or loadedModel:FindFirstChild("Handle", true) or loadedModel:FindFirstChildOfClass("BasePart")
        if mainPart then
            mainPart.Name = "Handle"
            
            -- Strip guide body parts
            for _, part in ipairs(loadedModel:GetDescendants()) do
                if part:IsA("BasePart") then
                    if isGuideBodyPart(part.Name) and part ~= mainPart then
                        part:Destroy()
                    else
                        part.Anchored = false
                        part.CanCollide = false
                        part.Massless = true
                    end
                end
            end
            cacheOriginalSizes(loadedModel)
            
            -- Align attachments (handles head, back, waist halos perfectly)
            local attachment = mainPart:FindFirstChildOfClass("Attachment")
            local targetBodyPart = head
            local c0 = CFrame.new(0, 0, 0)
            local c1 = CFrame.new(0, 0, 0)
            
            if attachment then
                local attachName = attachment.Name
                for _, child in ipairs(character:GetDescendants()) do
                    if child:IsA("Attachment") and child.Name == attachName then
                        targetBodyPart = child.Parent
                        c0 = child.CFrame
                        c1 = attachment.CFrame
                        break
                    end
                end
            end
            
            local weld = Instance.new("Weld")
            weld.Name = "AccessoryWeld"
            weld.Part0 = targetBodyPart
            weld.Part1 = mainPart
            weld.C0 = c0
            weld.C1 = c1
            weld.Parent = mainPart
            
            loadedModel.Parent = character
            currentHaloModel = loadedModel
            
            local rotateClouds = loadedModel:FindFirstChild("rotateclouds")
            local rotateMotor = rotateClouds and (rotateClouds:FindFirstChildOfClass("Motor6D") or rotateClouds:FindFirstChild("Motor6D", true))
            
            local startTick = tick()
            activeAnimConn = RunService.RenderStepped:Connect(function()
                local elapsed = tick() - startTick
                local bobOffset = math.sin(elapsed * 1.6) * 0.12
                local tiltX = math.sin(elapsed * 1.4) * 0.02
                local tiltZ = math.cos(elapsed * 1.4) * 0.02
                
                weld.C0 = c0 * CFrame.new(0, getgenv().HaloHeightOffset + bobOffset, 0) * CFrame.Angles(tiltX, 0, tiltZ)
                if rotateMotor then
                    pcall(function() rotateMotor.Transform = CFrame.Angles(0, elapsed * 0.4, 0) end)
                end
            end)
        end
    end
    applyScaleMultiplier(getgenv().HaloScaleMultiplier)
    pcall(updateCustomizerPartList)
end

-- ─── STEP 6: ROBUST INVENTORY CARD AUTO-INJECTOR ───
local cachedTemplateCard = nil
local function findInnerContainer()
    for _, desc in ipairs(playerGui:GetDescendants()) do
        if desc.Name == "Inner" and desc:IsA("GuiObject") then
            return desc
        end
    end
    return nil
end

local function getTemplateCard()
    if cachedTemplateCard and cachedTemplateCard.Parent then
        return cachedTemplateCard
    end
    local inner = findInnerContainer()
    if inner then
        for _, child in ipairs(inner:GetChildren()) do
            if child:IsA("GuiObject") and not child:IsA("UIGridLayout") and not child:IsA("UIAspectRatioConstraint") and not child:GetAttribute("IsAntigravityFake") then
                cachedTemplateCard = child:Clone()
                cachedTemplateCard.Name = "AntigravityTemplateCard"
                cachedTemplateCard.Visible = false
                cachedTemplateCard:SetAttribute("IsAntigravityFake", nil)
                return cachedTemplateCard
            end
        end
    end
    return cachedTemplateCard
end

local function injectInventoryCard(item)
    local inner = findInnerContainer()
    if not inner then return end
    
    local template = getTemplateCard()
    if not template then return end
    
    local existing = inner:FindFirstChild(item.Name)
    if not existing then
        local clone = template:Clone()
        clone.Name = item.Name
        clone:SetAttribute("IsAntigravityFake", true)
        
        -- Disable card scripts
        for _, child in ipairs(clone:GetDescendants()) do
            if child:IsA("LocalScript") or child:IsA("Script") then
                child.Disabled = true
            end
        end
        local imgLabel = clone:FindFirstChild("Image") or clone:FindFirstChildOfClass("ImageLabel") or clone:FindFirstChild("Button", true)
        if imgLabel and imgLabel:IsA("ImageLabel") then
            imgLabel.Image = item.Image
            imgLabel.ImageRectOffset = Vector2.new(0, 0)
            imgLabel.ImageRectSize = Vector2.new(0, 0)
        end
        local assetName = clone:FindFirstChild("AssetName")
        if assetName and assetName:IsA("StringValue") then
            assetName.Value = item.Name
        end
        for _, child in ipairs(clone:GetChildren()) do
            if child:IsA("TextLabel") or child:IsA("TextButton") then
                child.Text = item.Name
            end
        end
        local clickBtn = clone:IsA("GuiButton") and clone or clone:FindFirstChildOfClass("GuiButton") or clone:FindFirstChild("Button", true)
        if clickBtn then
            clickBtn.MouseButton1Click:Connect(function()
                equipHalo3D(item.Name)
            end)
        end
        clone.Parent = inner
    end
    
    -- Ensure custom cards are ALWAYS visible, overriding game filters (keeps them visible inside "Halos" tab!)
    local card = inner:FindFirstChild(item.Name)
    if card then
        card.Visible = true
    end
end

-- Auto-refresh connection
if getgenv().FakeItemsConnection then pcall(function() getgenv().FakeItemsConnection:Disconnect() end) end
getgenv().FakeItemsConnection = RunService.RenderStepped:Connect(function()
    pcall(function()
        local inner = findInnerContainer()
        if inner then
            for _, item in ipairs(getgenv().RequestedFakeItems) do
                injectInventoryCard(item)
            end
        end
    end)
end)

-- ─── STEP 7: BUILD MASTER HUD & CUSTOMIZER INTERFACE ───
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AntigravityMasterSuiteGui"
screenGui.ResetOnSpawn = false
pcall(function() screenGui.Parent = game:GetService("CoreGui") end)
if not screenGui.Parent then screenGui.Parent = playerGui end

local function setStatusText(text)
    local bar = screenGui:FindFirstChild("StatusBar", true)
    if bar then bar.Text = text end
end

    -- Top Bar Frame (Classic Layout - 480px width)
    local topBar = Instance.new("Frame")
    topBar.Name = "AntigravityMasterSuiteGui"
    topBar.Size = UDim2.new(0, 480, 0, 50)
    topBar.Position = UDim2.new(0.5, -240, 0, 20)
    topBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    topBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    topBar.BorderSizePixel = 1
    topBar.Active = true
    topBar.Draggable = true
    topBar.Parent = screenGui
    
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0.55, 0, 1, 0)
    textBox.Position = UDim2.new(0, 0, 0, 0)
    textBox.PlaceholderText = "Enter halo name..."
    textBox.Text = ""
    textBox.TextColor3 = Color3.fromRGB(0, 0, 0)
    textBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
    textBox.BackgroundTransparency = 1
    textBox.BorderSizePixel = 0
    textBox.Font = Enum.Font.SourceSans
    textBox.TextSize = 20
    textBox.ClearTextOnFocus = false
    textBox.TextXAlignment = Enum.TextXAlignment.Left
    
    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 12)
    padding.Parent = textBox
    textBox.Parent = topBar
    
    local reqBtn = Instance.new("TextButton")
    reqBtn.Size = UDim2.new(0.20, 0, 1, 0)
    reqBtn.Position = UDim2.new(0.55, 0, 0, 0)
    reqBtn.Text = "Request!"
    reqBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    reqBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    reqBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    reqBtn.BorderSizePixel = 1
    reqBtn.Font = Enum.Font.SourceSans
    reqBtn.TextSize = 18
    reqBtn.Parent = topBar
    
    local scanBtn = Instance.new("TextButton")
    scanBtn.Size = UDim2.new(0.25, 0, 1, 0)
    scanBtn.Position = UDim2.new(0.75, 0, 0, 0)
    scanBtn.Text = "Scan Server!"
    scanBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    scanBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 250)
    scanBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    scanBtn.BorderSizePixel = 1
    scanBtn.Font = Enum.Font.SourceSansBold
    scanBtn.TextSize = 16
    scanBtn.Parent = topBar

-- Red Close X Button (Top Right Y=-8)
local closeX = Instance.new("TextButton")
closeX.Size = UDim2.new(0, 20, 0, 20)
closeX.Position = UDim2.new(1, -22, 0, -22)
closeX.Text = "✕"
closeX.TextColor3 = Color3.fromRGB(255, 255, 255)
closeX.BackgroundTransparency = 1
closeX.Font = Enum.Font.GothamBold
closeX.TextSize = 13
closeX.Parent = topBar

local closeXGradient = Instance.new("UIGradient")
closeXGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 60, 150)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 50, 255))
})
closeXGradient.Parent = closeX

-- Dark status bar below
local statusBar = Instance.new("TextLabel")
statusBar.Name = "StatusBar"
statusBar.Size = UDim2.new(1, 0, 0, 22)
statusBar.Position = UDim2.new(0, 0, 1, 4)
statusBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
statusBar.BorderSizePixel = 0
statusBar.Text = "Status: Ready..."
statusBar.TextColor3 = Color3.fromRGB(255, 255, 255)
statusBar.Font = Enum.Font.GothamSemibold
statusBar.TextSize = 10
statusBar.Parent = topBar

local statusBgGrad = Instance.new("UIGradient")
statusBgGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(28, 18, 38))
})
statusBgGrad.Parent = statusBar

local statusStroke = Instance.new("UIStroke")
statusStroke.Thickness = 1.2
statusStroke.Color = Color3.fromRGB(255, 60, 150)
statusStroke.Parent = statusBar

local statusStrokeGrad = Instance.new("UIGradient")
statusStrokeGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 60, 150)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 50, 255))
})
statusStrokeGrad.Parent = statusStroke

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(0, 6)
statusCorner.Parent = statusBar

local statusTextGrad = Instance.new("UIGradient")
statusTextGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 140, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 60, 150))
})
statusTextGrad.Parent = statusBar

closeX.MouseButton1Click:Connect(function()
    clearClientHalo()
    screenGui:Destroy()
end)

-- ─── STEP 8: CUSTOMIZER PANEL FRAME ───
local custFrame = Instance.new("Frame")
custFrame.Name = "CustomizerPanel"
custFrame.Size = UDim2.new(0, 260, 0, 340)
custFrame.Position = UDim2.new(0.5, -130, 0.5, -170)
custFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
custFrame.BorderSizePixel = 0
custFrame.Active = true
custFrame.Draggable = true
custFrame.Visible = false
custFrame.Parent = screenGui

local custBgGradient = Instance.new("UIGradient")
custBgGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(28, 18, 38))
})
custBgGradient.Rotation = 45
custBgGradient.Parent = custFrame

local custCorner = Instance.new("UICorner")
custCorner.CornerRadius = UDim.new(0, 10)
custCorner.Parent = custFrame

local custStroke = Instance.new("UIStroke")
custStroke.Thickness = 1.5
custStroke.Color = Color3.fromRGB(255, 255, 255)
custStroke.Parent = custFrame

local custStrokeGradient = Instance.new("UIGradient")
custStrokeGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 60, 150)), -- Hot Pink
    ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 50, 255))  -- Purple
})
custStrokeGradient.Rotation = 45
custStrokeGradient.Parent = custStroke

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Halo Customizer Panel"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 13
titleLabel.Parent = custFrame

local titleLabelGrad = Instance.new("UIGradient")
titleLabelGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 60, 150)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 100, 255))
})
titleLabelGrad.Parent = titleLabel

-- Height controls
local heightFrame = Instance.new("Frame")
heightFrame.Size = UDim2.new(0.9, 0, 0, 40)
heightFrame.Position = UDim2.new(0.05, 0, 0, 40)
heightFrame.BackgroundTransparency = 1
heightFrame.Parent = custFrame

local heightLabel = Instance.new("TextLabel")
heightLabel.Size = UDim2.new(0.4, 0, 1, 0)
heightLabel.Text = "Height: 0.0"
heightLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
heightLabel.BackgroundTransparency = 1
heightLabel.Font = Enum.Font.GothamSemibold
heightLabel.TextSize = 13
heightLabel.Parent = heightFrame

local heightMinus = Instance.new("TextButton")
heightMinus.Size = UDim2.new(0.25, 0, 0.8, 0)
heightMinus.Position = UDim2.new(0.45, 0, 0.1, 0)
heightMinus.Text = "-"
heightMinus.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
heightMinus.TextColor3 = Color3.fromRGB(255, 255, 255)
heightMinus.Font = Enum.Font.GothamBold
heightMinus.TextSize = 14
heightMinus.Parent = heightFrame

local heightPlus = Instance.new("TextButton")
heightPlus.Size = UDim2.new(0.25, 0, 0.8, 0)
heightPlus.Position = UDim2.new(0.75, 0, 0.1, 0)
heightPlus.Text = "+"
heightPlus.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
heightPlus.TextColor3 = Color3.fromRGB(255, 255, 255)
heightPlus.Font = Enum.Font.GothamBold
heightPlus.TextSize = 14
heightPlus.Parent = heightFrame

heightMinus.MouseButton1Click:Connect(function()
    getgenv().HaloHeightOffset = math.clamp(getgenv().HaloHeightOffset - 0.1, -10, 10)
    heightLabel.Text = string.format("Height: %.1f", getgenv().HaloHeightOffset)
end)

heightPlus.MouseButton1Click:Connect(function()
    getgenv().HaloHeightOffset = math.clamp(getgenv().HaloHeightOffset + 0.1, -10, 10)
    heightLabel.Text = string.format("Height: %.1f", getgenv().HaloHeightOffset)
end)

-- Scale controls
local scaleFrame = Instance.new("Frame")
scaleFrame.Size = UDim2.new(0.9, 0, 0, 40)
scaleFrame.Position = UDim2.new(0.05, 0, 0, 90)
scaleFrame.BackgroundTransparency = 1
scaleFrame.Parent = custFrame

local scaleLabel = Instance.new("TextLabel")
scaleLabel.Size = UDim2.new(0.4, 0, 1, 0)
scaleLabel.Text = "Scale: 1.00x"
scaleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
scaleLabel.BackgroundTransparency = 1
scaleLabel.Font = Enum.Font.GothamSemibold
scaleLabel.TextSize = 13
scaleLabel.Parent = scaleFrame

local scaleMinus = Instance.new("TextButton")
scaleMinus.Size = UDim2.new(0.25, 0, 0.8, 0)
scaleMinus.Position = UDim2.new(0.45, 0, 0.1, 0)
scaleMinus.Text = "-"
scaleMinus.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
scaleMinus.TextColor3 = Color3.fromRGB(255, 255, 255)
scaleMinus.Font = Enum.Font.GothamBold
scaleMinus.TextSize = 14
scaleMinus.Parent = scaleFrame

local scalePlus = Instance.new("TextButton")
scalePlus.Size = UDim2.new(0.25, 0, 0.8, 0)
scalePlus.Position = UDim2.new(0.75, 0, 0.1, 0)
scalePlus.Text = "+"
scalePlus.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
scalePlus.TextColor3 = Color3.fromRGB(255, 255, 255)
scalePlus.Font = Enum.Font.GothamBold
scalePlus.TextSize = 14
scalePlus.Parent = scaleFrame

scaleMinus.MouseButton1Click:Connect(function()
    getgenv().HaloScaleMultiplier = math.clamp(getgenv().HaloScaleMultiplier - 0.05, 0.2, 3.0)
    scaleLabel.Text = string.format("Scale: %.2fx", getgenv().HaloScaleMultiplier)
    applyScaleMultiplier(getgenv().HaloScaleMultiplier)
end)

scalePlus.MouseButton1Click:Connect(function()
    getgenv().HaloScaleMultiplier = math.clamp(getgenv().HaloScaleMultiplier + 0.05, 0.2, 3.0)
    scaleLabel.Text = string.format("Scale: %.2fx", getgenv().HaloScaleMultiplier)
    applyScaleMultiplier(getgenv().HaloScaleMultiplier)
end)

-- Color parts scroll container
local partListScroll = Instance.new("ScrollingFrame")
partListScroll.Size = UDim2.new(0.9, 0, 0, 180)
partListScroll.Position = UDim2.new(0.05, 0, 0, 140)
partListScroll.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
partListScroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
partListScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
partListScroll.ScrollBarThickness = 6
partListScroll.Parent = custFrame

local scrollLayout = Instance.new("UIListLayout")
scrollLayout.Padding = UDim.new(0, 4)
scrollLayout.Parent = partListScroll

-- HSV Color Wheel Popup Panel
local wheelFrame = Instance.new("Frame")
wheelFrame.Name = "ColorWheelFrame"
wheelFrame.Size = UDim2.new(0, 200, 0, 200)
wheelFrame.Position = UDim2.new(1, 10, 0, 0)
wheelFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
wheelFrame.BorderColor3 = Color3.fromRGB(50, 50, 50)
wheelFrame.BorderSizePixel = 1
wheelFrame.Visible = false
wheelFrame.Parent = custFrame

local wheelImg = Instance.new("ImageButton")
wheelImg.Size = UDim2.new(0.9, 0, 0.9, 0)
wheelImg.Position = UDim2.new(0.05, 0, 0.05, 0)
wheelImg.Image = "rbxassetid://14457492147"
wheelImg.BackgroundTransparency = 1
wheelImg.Parent = wheelFrame

local function colorPart(partName, color)
    if not currentHaloModel then return end
    for _, desc in ipairs(currentHaloModel:GetDescendants()) do
        if desc.Name == partName or desc.Parent.Name == partName then
            pcall(function()
                if desc:IsA("BasePart") then
                    desc.Color = color
                elseif desc:IsA("Decal") or desc:IsA("Texture") then
                    desc.Color3 = color
                elseif desc:IsA("ParticleEmitter") then
                    desc.Color = ColorSequence.new(color)
                elseif desc:IsA("Light") then
                    desc.Color = color
                elseif desc:IsA("Trail") or desc:IsA("Beam") then
                    desc.Color = ColorSequence.new(color)
                end
            end)
        end
    end
end

-- Color wheel click/drag HSV conversion handler
wheelImg.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and selectedPartToColor then
        local function updateColor(inputObj)
            local mousePos = inputObj.Position
            local wheelPos = wheelImg.AbsolutePosition
            local wheelSize = wheelImg.AbsoluteSize
            local relX = mousePos.X - wheelPos.X
            local relY = mousePos.Y - wheelPos.Y
            
            local dx = relX - wheelSize.X / 2
            local dy = relY - wheelSize.Y / 2
            local angle = math.atan2(-dy, dx)
            if angle < 0 then angle = angle + 2 * math.pi end
            local h = angle / (2 * math.pi)
            
            local dist = math.sqrt(dx*dx + dy*dy)
            local s = math.clamp(dist / (wheelSize.X / 2), 0, 1)
            
            local finalColor = Color3.fromHSV(h, s, 1)
            colorPart(selectedPartToColor, finalColor)
        end
        
        updateColor(input)
        
        local conn
        conn = UserInputService.InputChanged:Connect(function(changedInput)
            if changedInput.UserInputType == Enum.UserInputType.MouseMovement or changedInput.UserInputType == Enum.UserInputType.Touch then
                updateColor(changedInput)
            end
        end)
        
        local endConn
        endConn = UserInputService.InputEnded:Connect(function(endedInput)
            if endedInput.UserInputType == Enum.UserInputType.MouseButton1 or endedInput.UserInputType == Enum.UserInputType.Touch then
                conn:Disconnect()
                endConn:Disconnect()
            end
        end)
    end
end)

-- Dynamically list colorable parts inside model
updateCustomizerPartList = function()
    for _, child in ipairs(partListScroll:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    if not currentHaloModel then return end
    
    local uniquePartNames = {}
    for _, desc in ipairs(currentHaloModel:GetDescendants()) do
        if desc:IsA("BasePart") and desc.Name ~= "Handle" then
            uniquePartNames[desc.Name] = true
        elseif desc:IsA("ParticleEmitter") or desc:IsA("Decal") or desc:IsA("Light") then
            uniquePartNames[desc.Name] = true
        end
    end
    
    local keys = {}
    for k, _ in pairs(uniquePartNames) do table.insert(keys, k) end
    table.sort(keys)
    
    partListScroll.CanvasSize = UDim2.new(0, 0, 0, #keys * 28 + 10)
    
    for _, pName in ipairs(keys) do
        local pBtn = Instance.new("TextButton")
        pBtn.Size = UDim2.new(0.95, 0, 0, 24)
        pBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        pBtn.TextColor3 = Color3.fromRGB(240, 240, 240)
        pBtn.Text = "  " .. pName
        pBtn.Font = Enum.Font.GothamSemibold
        pBtn.TextSize = 12
        pBtn.TextXAlignment = Enum.TextXAlignment.Left
        pBtn.Parent = partListScroll
        
        pBtn.MouseButton1Click:Connect(function()
            selectedPartToColor = pName
            wheelFrame.Visible = true
            setStatusText("Status: Coloring part '" .. pName .. "'...")
        end)
    end
end

-- ─── STEP 9: TRIGGERS & CORE EVENTS ───

local function executeRequest()
    local nameInput = searchBox.Text
    if nameInput == "" then return end
    
    setStatusText("Status: Auto-correcting '" .. nameInput .. "'...")
    local match = findBestHaloMatch(nameInput)
    if not match then
        setStatusText("Status: Spelled too differently, using Fallback Ring.")
        match = {official = "Fallback Halo", id = "rbxassetid://327421319"}
    else
        setStatusText("Status: Capturing '" .. match.official .. "' motion: 99%...")
        task.wait(0.6)
    end
    
    -- Inject the fake item card directly into the inventory grid dynamically!
    local existsInFakeItems = false
    for _, item in ipairs(getgenv().RequestedFakeItems) do
        if item.Name == match.official then existsInFakeItems = true break end
    end
    if not existsInFakeItems then
        table.insert(getgenv().RequestedFakeItems, {
            Name = match.official,
            Image = match.id or "rbxassetid://327421319"
        })
    end
    
    custFrame.Visible = true
    setStatusText("Status: Added " .. match.official .. " to your Inventory grid!")
end

reqBtn.MouseButton1Click:Connect(executeRequest)
searchBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then executeRequest() end
end)

-- Scan Server: Grab models + icons
scanBtn.MouseButton1Click:Connect(function()
    scanServerForHaloModels(setStatusText)
end)

-- Library toggle customizer


-- Keybind Toggle
local visibleState = true
UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.RightShift then
        visibleState = not visibleState
        topBar.Visible = visibleState
        custFrame.Visible = visibleState and (currentHaloModel ~= nil)
        wheelFrame.Visible = false
    end
end)

print("[Antigravity] Spawner and Customizer Suite fully initialized!")
setStatusText("Status: Ready! Press [RightShift] to Toggle UI visibility.")
