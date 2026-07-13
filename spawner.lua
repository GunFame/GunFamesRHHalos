


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
while not player do
    task.wait(0.1)
    player = Players.LocalPlayer
end
local playerGui = player:WaitForChild("PlayerGui", 30)
if not playerGui then
    print("[Antigravity] ERROR: PlayerGui failed to load!")
    return
end



local HttpService = game:GetService("HttpService")
local whitelistUrl = "https://raw.githubusercontent.com/GunFame/GunFamesRHHalos/main/Havenwait.json?nocache=" .. math.random(1, 999999)

local function isWhitelisted()
    local myId = player.UserId
    

    if myId == 11150537473 then 
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
    

    while true do
        task.wait(1.0)
    end
end


pcall(function()
    local MarketplaceService = game:GetService("MarketplaceService")
    local hook = hookmetamethod or (getgenv and getgenv().hookmetamethod)
    if hook then
        local oldIndex
        oldIndex = hookmetamethod(game, "__index", function(self, key)
            if self == MarketplaceService and (key == "UserOwnsGamePassAsync" or key == "userOwnsGamePassAsync") then
                return function(srv, userId, gpId)
                    return true
                end
            end
            return oldIndex(self, key)
        end)
        print("[Antigravity] Gamepass bypass metamethod hook loaded successfully!")
    else

        local raw = MarketplaceService.UserOwnsGamePassAsync
        MarketplaceService.UserOwnsGamePassAsync = function(self, userId, gpId)
            return true
        end
        print("[Antigravity] Direct Gamepass method override loaded!")
    end
end)


local getasset = getcustomasset or getsynasset or (getgenv and (getgenv().getcustomasset or getgenv().getsynasset))
local isfile_safe = isfile or (getgenv and getgenv().isfile) or function() return false end
local readfile_safe = readfile or (getgenv and getgenv().readfile)
local writefile_safe = writefile or (getgenv and getgenv().writefile)


local synsaveinstance = nil
pcall(function()
    local Params = { 
        RepoURL = "https://raw.githubusercontent.com/luau/UniversalSynSaveInstance/main/", 
        SSI = "saveinstance", 
    } 
    synsaveinstance = loadstring(game:HttpGet(Params.RepoURL .. Params.SSI .. ".luau", true), Params.SSI)() 
    if synsaveinstance then
        print("[Antigravity] UniversalSynSaveInstance loaded successfully!")
    end
end)


getgenv().RequestedFakeItems = getgenv().RequestedFakeItems or {}
getgenv().LoadedHaloCache = getgenv().LoadedHaloCache or {}
getgenv().ActiveClientHalos = getgenv().ActiveClientHalos or {}
getgenv().ActiveClientHalosOrder = getgenv().ActiveClientHalosOrder or {}


local function cleanupExistingCharacterHalos()
    local character = player.Character or workspace:FindFirstChild(player.Name)
    if character then
        for _, child in ipairs(character:GetChildren()) do
            if child:GetAttribute("IsAntigravityFake") or child.Name:find("ClientFakeHalo") then
                pcall(function() child:Destroy() end)
            end
        end
    end
end
cleanupExistingCharacterHalos()


local halos = {

    {short = "tidalglow 2026", official = "Royale Jelly 🦑 Tidalglow Halo 2026", file = "Tidalglow_Halo_2026", id = "rbxassetid://122528220847482", synonyms = {"royale jelly", "🦑", "jelly"}},
    {short = "flowering 2026", official = "Frolicking Fields Halo 2026 🐇 Flowering", file = "Flowering_Halo_2026", id = "rbxassetid://104637554842874", synonyms = {"frolicking fields", "🐇", "rabbit", "bunny"}},
    {short = "everfriend 2026", official = "Eternity's Aim 🏹 Everfriend 2026", file = "Everfriend_Halo_2026", id = "rbxassetid://99669755697377", synonyms = {"eternity aim", "eternity's aim", "🏹", "bow"}},


    {short = "glitterfrost 2025", official = "Wishing Star Woods Halo 🌟 Glitterfrost 2025", file = "Glitterfrost_Halo_2025", id = "rbxassetid://126225645930600", synonyms = {"wishing star", "wishing star woods", "🌟", "star"}},
    {short = "eveningfall 2025", official = "🕸️Silk Spun Halo🕸️Eveningfall 2025", file = "Eveningfall_Halo_2025", id = "rbxassetid://117242240826038", synonyms = {"silk spun", "🕸️", "spider", "spiderweb"}},
    {short = "tidalglow 2025", official = "Luminous Lagoon 🐠 Tidalglow Halo 2025", file = "Tidalglow_Halo_2025", id = "rbxassetid://122528220847482", synonyms = {"luminous lagoon", "🐠", "fish", "lagoon"}},
    {short = "flowering 2025", official = "Moonlit Meadow 🌙 Flowering Halo 2025", file = "Flowering_Halo_2025", id = "rbxassetid://100011760485963", synonyms = {"moonlit meadow", "🌙", "moonlight", "moon"}},
    {short = "everfriend 2025", official = "Harmonic Hearts 💝 Everfriend Halo & Wand 2025", file = "Everfriend_Halo_2025", id = "rbxassetid://113199186870059", synonyms = {"harmonic hearts", "💝", "wand", "heart wand"}},


    {short = "glitterfrost 2024", official = "Glacial Angel ❄️ Glitterfrost Halo 2024", file = "Glitterfrost_Halo_2024", id = "rbxassetid://117426834287511", synonyms = {"glacial angel", "❄️", "ice", "snowflake"}},
    {short = "eveningfall 2024", official = "Dream Dust ⭐ Eveningfall Halo 2024", file = "Eveningfall_Halo_2024", id = "rbxassetid://111594977616534", synonyms = {"dream dust", "⭐", "dust"}},
    {short = "tidalglow 2024", official = "Royal Reef 💜 Tidalglow Halo 2024", file = "Tidalglow_Halo_2024", id = "rbxassetid://17747240677", synonyms = {"royal reef", "💜", "purple heart"}},
    {short = "flowering 2024", official = "Entwined Vines 💚 Flowering Halo 2024", file = "Flowering_Halo_2024", id = "rbxassetid://16966217172", synonyms = {"entwined vines", "💚", "green heart", "vines"}},
    {short = "everfriend 2024", official = "Divine Adoration 💛 Everfriend Halo 2024", file = "Everfriend_Halo_2024", id = "rbxassetid://16113190763", synonyms = {"divine adoration", "devine adoration", "💛", "yellow heart"}},


    {short = "glitterfrost 2023", official = "Frosty Fortitude Halo Glitterfrost 2023", file = "Glitterfrost_Halo_2023", id = "rbxassetid://15418042780", synonyms = {"glitterfrost 23", "winter 23", "frosty fortitude"}},
    {short = "halloween 2023", official = "Dark Fairy Halo Eveningfall 2023", file = "Dark_Fairy_Halo_Eveningfall_2023", id = "rbxassetid://14920928021", synonyms = {"dark fairy", "halloween 23", "eveningfall 23"}},
    {short = "tidalglow 2023", official = "Solarix Halo Tidalglow 2023", file = "Solarix_Halo_Tidalglow_2023", id = "rbxassetid://13608724752", synonyms = {"solarix 23", "tidalglow 23", "solarix"}},
    {short = "flowering 2023", official = "Starlight Halo Flowering 2023", file = "Starlight_Halo_Flowering_2023", id = "rbxassetid://12308414061", synonyms = {"starlight 23", "flowering 23"}},


    {short = "winter 2022", official = "Winter Halo 2022", file = "Winter_Halo_2022", id = "rbxassetid://11701160386", synonyms = {"winter 22", "win 22"}},
    {short = "autumn 2022", official = "Witching Hour Halo Autumn 2022", file = "Witching_Hour_Halo_Autumn_2022", id = "rbxassetid://11128798238", synonyms = {"witching hour", "autumn 22"}},
    {short = "mermaid 2022", official = "Mermaid Halo 2022", file = "Mermaid_Halo_2022", id = "rbxassetid://9734618910", synonyms = {"mermaid 22"}},
    {short = "spring 2022", official = "Spring Halo 2022", file = "Spring_Halo_2022", id = "rbxassetid://8694237780", synonyms = {"spring 22"}},
    {short = "winter 2021", official = "Winter Halo 2021", file = "Winter_Halo_2021", id = "rbxassetid://8145602687", synonyms = {"winter 21", "win 21"}},
    {short = "halloween 2021", official = "Halloween Halo 2021", file = "Halloween_Halo_2021", id = "rbxassetid://7603370999", synonyms = {"hal 21", "halloween 21"}},
    {short = "mermaid 2021", official = "Mermaid Halo 2021", file = "Mermaid_Halo_2021", id = "rbxassetid://6967735253", synonyms = {"mermaid 21"}},
    {short = "spring 2021", official = "Spring Halo 2021", file = "Spring_Halo_2021", id = "rbxassetid://6614509935", synonyms = {"spring 21"}},
    {short = "lucky 2021", official = "Lucky Halo 2021", file = "Lucky_Halo_2021", id = "rbxassetid://6479631004", synonyms = {"lucky 21", "luck 21"}},
    {short = "valentines 2021", official = "Valentines Halo 2021", file = "Valentines_Halo_2021", id = "rbxassetid://6289545706", synonyms = {"val 21", "valentines 21"}},
    {short = "winter 2020", official = "Winter Halo 2020", file = "Winter_Halo_2020", id = "rbxassetid://6028845861", synonyms = {"winter 20", "win 20"}},
    {short = "halloween 2020", official = "Halloween Halo 2020", file = "Halloween_Halo_2020", id = "rbxassetid://5812685640", synonyms = {"hal 20", "halloween 20"}},
    {short = "mermaid 2020", official = "Mermaid Halo 2020", file = "Mermaid_Halo_2020", id = "rbxassetid://5301644964", synonyms = {"mermaid 20"}},
    {short = "spring 2020", official = "Spring Halo 2020", file = "Spring_Halo_2020", id = "rbxassetid://4957139301", synonyms = {"spring 20"}},
    {short = "lucky 2020", official = "Lucky Halo 2020", file = "Lucky_Halo_2020", id = "rbxassetid://4791351335", synonyms = {"lucky 20", "luck 20"}},
    {short = "valentines 2020", official = "Valentines Halo 2020", file = "Valentines_Halo_2020", id = "rbxassetid://4687458906", synonyms = {"val 20", "valentines 20", "val20"}},
    {short = "winter 2019", official = "Winter Halo 2019", file = "Winter_Halo_2019", id = "rbxassetid://4501088914", synonyms = {"winter 19", "win 19"}},
    {short = "autumn 2019", official = "Autumn Halo 2019", file = "Autumn_Halo_2019", id = "rbxassetid://4266681961", synonyms = {"autumn 19"}},
    {short = "halloween 2019", official = "Halloween Halo 2019", file = "Halloween_Halo_2019", id = "rbxassetid://4103877961", synonyms = {"hal 19", "halloween 19", "hh19"}},
    {short = "mermaid 2019", official = "Mermaid Halo 2019", file = "Mermaid_Halo_2019", id = "rbxassetid://3136119047", synonyms = {"mermaid 19"}},
    {short = "easter 2019", official = "Easter Halo 2019", file = "Easter_Halo_2019", id = "rbxassetid://3028596202", synonyms = {"easter 19"}},
    {short = "lucky 2019", official = "Lucky Halo 2019", file = "Lucky_Halo_2019", id = "rbxassetid://2925342750", synonyms = {"lucky 19", "luck 19"}},
    {short = "valentines 2019", official = "Valentines Halo 2019", file = "Valentines_Halo_2019", id = "rbxassetid://2807591119", synonyms = {"val 19", "valentines 19"}},
    {short = "winter crystal 2018", official = "Winter Crystal Halo 2018", file = "Winter_Crystal_Halo_2018", id = "rbxassetid://2611120533", synonyms = {"winter 18", "win 18", "crystal 18"}},
    {short = "halloween 2018", official = "Halloween Halo 2018", file = "Halloween_Halo_2018", id = "rbxassetid://2425168561", synonyms = {"hal 18", "halloween 18"}},
    {short = "corrupt", official = "Corrupt Halo", file = "Corrupt_Halo", id = "rbxassetid://2342898583", synonyms = {"dark halo", "corrupt"}},
    {short = "glimmering light", official = "Glimmering Light Halo", file = "Glimmering_Light_Halo", id = "rbxassetid://2342893025", synonyms = {"light halo", "glimmering"}},


    {short = "enchantraverse", official = "Crown of the Realms ♡ Enchantraverse Halo", file = "Enchantraverse_Halo", id = "rbxassetid://6715619915", synonyms = {"realms", "enchantraverse", "crown of realms", "crown of the realms", "♡"}},
    {short = "crystal heart", official = "Crystal Heart💝Throne Halo", file = "Crystal_Heart_Throne_Halo", id = "rbxassetid://106935836471539", synonyms = {"throne", "heart throne", "quadruple diamonds", "4x reward"}},
    {short = "infinite diamonds", official = "Infinite Diamonds Halo", file = "Infinite_Diamonds_Halo", id = "rbxassetid://106935836471539", synonyms = {"infinite diamonds", "double diamonds", "2x reward"}},
    {short = "angel", official = "Angel Halo", file = "Angel_Halo", id = "rbxassetid://6128358104", synonyms = {"angel"}},
    {short = "alien", official = "Glimmering Alien Halo", file = "Glimmering_Alien_Halo", id = "rbxassetid://5812685640", synonyms = {"alien", "glimmering alien"}},
    {short = "diamond heart", official = "Diamond Heart Halo", file = "Diamond_Heart_Halo", id = "rbxassetid://93759035525542", synonyms = {"diamond heart", "heart halo"}},
    {short = "diamond", official = "Diamond Halo", file = "Diamond_Halo", id = "rbxassetid://106935836471539", synonyms = {"diamond", "dia"}}
}


for _, halo in ipairs(halos) do
    local short = halo.short
    local syns = {short}
    if halo.synonyms then
        for _, s in ipairs(halo.synonyms) do table.insert(syns, s) end
    end
    if short:find("valentines") then table.insert(syns, (short:gsub("valentines", "val")))
    elseif short:find("winter") then table.insert(syns, (short:gsub("winter", "win")))
    elseif short:find("halloween") then table.insert(syns, (short:gsub("halloween", "hal")))
    elseif short:find("lucky") then table.insert(syns, (short:gsub("lucky", "luck")))
    end
    halo.synonyms = syns
end


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

    local lowerInput = nameInput:lower()
    for _, halo in ipairs(halos) do
        if halo.official == nameInput or halo.official:lower() == lowerInput or cleanString(halo.official) == cleanString(nameInput) then
            return halo
        end
    end

    local cleanInput = cleanString(nameInput)
    if cleanInput == "" then return nil end
    

    for _, halo in ipairs(halos) do
        if cleanString(halo.short) == cleanInput then return halo end
        for _, syn in ipairs(halo.synonyms) do
            if cleanString(syn) == cleanInput then return halo end
        end
    end
    

    for _, halo in ipairs(halos) do
        if cleanString(halo.short):find(cleanInput, 1, true) then return halo end
        for _, syn in ipairs(halo.synonyms) do
            if cleanString(syn):find(cleanInput, 1, true) then return halo end
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
    
    if bestScore < 0.25 then return bestMatch end
    return nil
end


local cachedBodiceFrame = nil
local function findBodiceFrame()

    if cachedBodiceFrame and cachedBodiceFrame.Parent and cachedBodiceFrame:IsDescendantOf(playerGui) then
        return cachedBodiceFrame
    end
    

    for _, gui in ipairs(playerGui:GetChildren()) do
        if gui:IsA("ScreenGui") then
            local success, list = pcall(function() return gui:GetDescendants() end)
            if success and list then
                for _, desc in ipairs(list) do
                    if desc.Name == "Bodice" and desc:IsA("GuiObject") and desc.Parent and desc.Parent.Name == "Inner" then
                        cachedBodiceFrame = desc
                        return desc
                    end
                end
            end
        end
    end
    return nil
end


local function isGuideBodyPart(name)
    local n = name:lower()
    return n == "head" or n == "uppertorso" or n == "lowertorso" or n == "torso" 
        or n:find("arm") or n:find("leg") or n:find("hand") or n:find("foot")
end


local function serializeToRbxmx(inst)
    local refMap = {}
    local refCount = 0
    local function getRef(obj)
        if not obj then return "null" end
        if not refMap[obj] then
            refMap[obj] = "RBX" .. refCount
            refCount = refCount + 1
        end
        return refMap[obj]
    end

    local xml = {
        '<roblox xmlns:xmime="http://www.w3.org/2005/05/xmlmime" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://www.roblox.com/roblox.xsd" version="4">',
        '  <Meta name="ExplicitAutoJoints">true</Meta>',
        '  <External>null</External>',
        '  <External>nil</External>'
    }

    local function serializeNode(obj)
        local className = obj.ClassName
        local ref = getRef(obj)
        table.insert(xml, string.format('  <Item class="%s" referent="%s">', className, ref))
        table.insert(xml, '    <Properties>')
        
        local function addProp(propType, name, val)
            if propType == "string" then
                local cleanVal = tostring(val):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")
                table.insert(xml, string.format('      <string name="%s">%s</string>', name, cleanVal))
            elseif propType == "bool" then
                table.insert(xml, string.format('      <bool name="%s">%s</bool>', name, tostring(val)))
            elseif propType == "float" then
                table.insert(xml, string.format('      <float name="%s">%s</float>', name, tostring(val)))
            elseif propType == "int" then
                table.insert(xml, string.format('      <int name="%s">%d</int>', name, val))
            elseif propType == "Vector3" then
                table.insert(xml, string.format('      <Vector3 name="%s"><X>%s</X><Y>%s</Y><Z>%s</Z></Vector3>', name, tostring(val.X), tostring(val.Y), tostring(val.Z)))
            elseif propType == "Color3" then
                table.insert(xml, string.format('      <Color3 name="%s"><R>%s</R><G>%s</G><B>%s</B></Color3>', name, tostring(val.R), tostring(val.G), tostring(val.B)))
            elseif propType == "CFrame" then
                local c = {val:GetComponents()}
                table.insert(xml, string.format('      <CoordinateFrame name="%s"><X>%s</X><Y>%s</Y><Z>%s</Z><R00>%s</R00><R01>%s</R01><R02>%s</R02><R10>%s</R10><R11>%s</R11><R12>%s</R12><R20>%s</R20><R21>%s</R21><R22>%s</R22></CoordinateFrame>', 
                    name, tostring(c[1]), tostring(c[2]), tostring(c[3]), tostring(c[4]), tostring(c[5]), tostring(c[6]), tostring(c[7]), tostring(c[8]), tostring(c[9]), tostring(c[10]), tostring(c[11]), tostring(c[12])))
            elseif propType == "Ref" then
                table.insert(xml, string.format('      <Ref name="%s">%s</Ref>', name, getRef(val)))
            elseif propType == "Content" then
                local cleanUrl = tostring(val):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")
                table.insert(xml, string.format('      <Content name="%s"><url>%s</url></Content>', name, cleanUrl))
            end
        end
        
        pcall(function() addProp("string", "Name", obj.Name) end)
        if obj:IsA("BasePart") then
            pcall(function() addProp("Vector3", "Size", obj.Size) end)
            pcall(function() addProp("CFrame", "CFrame", obj.CFrame) end)
            pcall(function() addProp("Color3", "Color", obj.Color) end)
            pcall(function() addProp("float", "Transparency", obj.Transparency) end)
            pcall(function() addProp("bool", "Anchored", obj.Anchored) end)
            pcall(function() addProp("bool", "CanCollide", obj.CanCollide) end)
            pcall(function() addProp("bool", "Massless", obj.Massless) end)
        end
        if obj:IsA("MeshPart") then
            pcall(function() addProp("Content", "MeshId", obj.MeshId) end)
            pcall(function() addProp("Content", "TextureID", obj.TextureID) end)
        elseif obj:IsA("SpecialMesh") then
            pcall(function() addProp("Content", "MeshId", obj.MeshId) end)
            pcall(function() addProp("Content", "TextureId", obj.TextureId) end)
            pcall(function() addProp("Vector3", "Scale", obj.Scale) end)
            pcall(function() addProp("Vector3", "Offset", obj.Offset) end)
            pcall(function() addProp("int", "MeshType", obj.MeshType.Value) end)
        elseif obj:IsA("Decal") or obj:IsA("Texture") then
            pcall(function() addProp("Content", "Texture", obj.Texture) end)
            pcall(function() addProp("Color3", "Color3", obj.Color3) end)
            pcall(function() addProp("float", "Transparency", obj.Transparency) end)
            pcall(function() addProp("int", "Face", obj.Face.Value) end)
        elseif obj:IsA("Weld") or obj:IsA("Motor6D") or obj:IsA("WeldConstraint") or obj:IsA("ManualWeld") then
            pcall(function() addProp("Ref", "Part0", obj.Part0) end)
            pcall(function() addProp("Ref", "Part1", obj.Part1) end)
            pcall(function() addProp("CFrame", "C0", obj.C0) end)
            pcall(function() addProp("CFrame", "C1", obj.C1) end)
        elseif obj:IsA("Attachment") then
            pcall(function() addProp("CFrame", "CFrame", obj.CFrame) end)
        end
        
        table.insert(xml, '    </Properties>')
        for _, child in ipairs(obj:GetChildren()) do serializeNode(child) end
        table.insert(xml, '  </Item>')
    end
    
    serializeNode(inst)
    table.insert(xml, '</roblox>')
    return table.concat(xml, "\n")
end


local function createCleanModel(inst)

    pcall(function()
        inst.Archivable = true
        for _, desc in ipairs(inst:GetDescendants()) do
            desc.Archivable = true
        end
    end)
    

    local isPlayerAccessory = false
    local headCFrame = nil
    local char = inst.Parent
    if char and char:IsA("Model") and char:FindFirstChildOfClass("Humanoid") then
        isPlayerAccessory = true
        local head = char:FindFirstChild("Ghost Head") or char:FindFirstChild("Head") or char:FindFirstChildOfClass("Part")
        if head then
            headCFrame = head.CFrame
        end
    end


    local extraClones = {}
    if isPlayerAccessory and char then
        local haloWords = {}
        local cleanHaloName = inst.Name:lower():gsub("[^%w%s]", " ")
        for word in cleanHaloName:gmatch("%S+") do
            if #word >= 4 and word ~= "halo" and not tonumber(word) then
                haloWords[word] = true
            end
        end
        
        for _, child in ipairs(char:GetChildren()) do
            if child ~= inst and (child:IsA("Accessory") or child:IsA("Model")) then
                local isMatch = false
                local childLower = child.Name:lower()
                

                if childLower:find("wing") or childLower:find("feather") or childLower:find("orbit") or childLower:find("effect") 
                   or childLower:find("butterfly") or childLower:find("butterflies") or childLower:find("petal") or childLower:find("blossom")
                   or childLower:find("flower") or childLower:find("sprout") or childLower:find("candle") or childLower:find("web")
                   or childLower:find("spirit") or childLower:find("sparkle") or childLower:find("glow") or childLower:find("heart")
                   or childLower:find("star") or childLower:find("ring") or childLower:find("crescent") or childLower:find("clover") then
                    isMatch = true
                else

                    local cleanChildName = childLower:gsub("[^%w%s]", " ")
                    for word in cleanChildName:gmatch("%S+") do
                        if haloWords[word] then
                            isMatch = true
                            break
                        end
                    end
                end
                

                if isMatch then
                    if childLower:find("hair") or childLower:find("wig") or childLower:find("skirt") or childLower:find("heel") or childLower:find("shoe") or childLower:find("dress") or childLower:find("bodice") or childLower:find("corset") or childLower:find("sleeve") then
                        isMatch = false
                    end
                end
                
                if isMatch then
                    pcall(function()
                        child.Archivable = true
                        for _, desc in ipairs(child:GetDescendants()) do
                            desc.Archivable = true
                        end
                        local clone = child:Clone()
                        if clone then
                            table.insert(extraClones, clone)
                            print("[Wave Auto-Saver] Found extra matching part of the halo: " .. child.Name)
                        end
                    end)
                end
            end
        end
    end

    local success, cleanModel = pcall(function()
        local clonedInst = inst:Clone()
        if not clonedInst then
            error("Failed to clone halo accessory: " .. tostring(inst.Name))
        end
        

        local model = clonedInst
        if clonedInst:IsA("Accessory") then
            model = Instance.new("Model")
            model.Name = clonedInst.Name
            for _, child in ipairs(clonedInst:GetChildren()) do
                child.Parent = model
            end
            clonedInst:Destroy()
        end
        

        for _, ext in ipairs(extraClones) do
            local items = ext:IsA("Accessory") and ext:GetChildren() or {ext}
            for _, item in ipairs(items) do
                if item:IsA("BasePart") or item:IsA("Folder") or item:IsA("Configuration") then
                    item.Parent = model
                elseif item:IsA("Model") then
                    for _, child in ipairs(item:GetChildren()) do
                        child.Parent = model
                    end
                else
                    item.Parent = model
                end
            end
            pcall(function() ext:Destroy() end)
        end
        

        local handle = model:FindFirstChild("Handle", true)
        if not handle then

            for _, item in ipairs(model:GetDescendants()) do
                if item:IsA("BasePart") then
                    handle = item
                    handle.Name = "Handle"
                    break
                end
            end
        end
        
        if not handle then
            model:Destroy()
            error("No BaseParts found in halo accessory structure")
        end
        
        model.PrimaryPart = handle
        

        local parts = {}
        for _, item in ipairs(model:GetDescendants()) do
            if item:IsA("BasePart") then
                item.Anchored = false
                item.CanCollide = false
                item.Massless = true
                table.insert(parts, item)
            end
            

            if item:IsA("Decal") or item:IsA("Texture") then
                pcall(function() item:Destroy() end)
            elseif item:IsA("MeshPart") then
                pcall(function() item.TextureID = "" end)
            elseif item:IsA("SpecialMesh") then
                pcall(function() item.TextureId = "" end)
            end
        end
        

        local function isPartWeldedInternally(part)
            for _, joint in ipairs(model:GetDescendants()) do
                if joint:IsA("JointInstance") or joint:IsA("WeldConstraint") then
                    local p0 = joint.Part0
                    local p1 = joint.Part1
                    if (p0 == part or p1 == part) then
                        local other = (p0 == part) and p1 or p0
                        if other and other:IsDescendantOf(model) and other ~= part then
                            return true
                        end
                    end
                end
            end
            return false
        end
        

        for _, part in ipairs(parts) do
            if part ~= handle then
                if not isPartWeldedInternally(part) then

                    for _, joint in ipairs(model:GetDescendants()) do
                        if joint:IsA("JointInstance") or joint:IsA("WeldConstraint") then
                            if (joint.Part0 == handle and joint.Part1 == part) or (joint.Part0 == part and joint.Part1 == handle) then
                                pcall(function() joint:Destroy() end)
                            end
                        end
                    end
                    
                    local weld = Instance.new("Weld")
                    weld.Name = "AntigravityInternalWeld"
                    weld.Part0 = handle
                    weld.Part1 = part
                    weld.C0 = handle.CFrame:Inverse() * part.CFrame
                    weld.C1 = CFrame.new()
                    weld.Parent = handle
                end
            end
        end
        

        if isPlayerAccessory and headCFrame then
            local originalOffset = headCFrame:PointToObjectSpace(handle.CFrame.Position)
            local centeredLocalOffset = Vector3.new(0, originalOffset.Y, 0)
            local centeredWorldPosition = headCFrame:PointToWorldSpace(centeredLocalOffset)
            

            handle.CFrame = CFrame.new(centeredWorldPosition) * headCFrame.Rotation
        end
        
        return model
    end)
    
    if not success then
        warn("[Antigravity Autosaver Model Cleanup Error]: " .. tostring(cleanModel))
        return nil
    end
    return cleanModel
end


local function equipHalo3D(haloName)
    local charModel = player.Character or workspace:FindFirstChild(player.Name)
    if not charModel then return end
    

    local head = charModel:FindFirstChild("Ghost Head") or charModel:FindFirstChild("Head")
    if not head then
        head = charModel:FindFirstChildOfClass("Part")
        if not head then return end
    end
    
    if not getasset then
        print("[Wave] ERROR: Executor does not support getcustomasset wrapper!")
        return
    end
    
    local isNumeric = tonumber(haloName) ~= nil
    local match = nil
    if isNumeric then
        match = {
            short = haloName,
            official = "Asset_" .. haloName,
            file = "Asset_" .. haloName,
            id = "rbxassetid://" .. haloName
        }
    else
        match = findBestHaloMatch(haloName)
    end
    local cleanName = match and match.file or haloName:gsub("%s+", "_"):gsub("[^%w_]", "")
    

    if getgenv().ActiveClientHalos[haloName] then
        local oldData = getgenv().ActiveClientHalos[haloName]
        if oldData.Connection then oldData.Connection:Disconnect() end
        if oldData.Model then oldData.Model:Destroy() end
        getgenv().ActiveClientHalos[haloName] = nil
        
        for i, name in ipairs(getgenv().ActiveClientHalosOrder) do
            if name == haloName then
                table.remove(getgenv().ActiveClientHalosOrder, i)
                break
            end
        end
        
        print("[Wave] Unequipped: " .. haloName)
        pcall(rebuildColorPanel)
        return
    end
    

    local possibleNames = {
        cleanName .. ".rbxmx",
        cleanName:lower() .. ".rbxmx",
        cleanName:gsub("_", " ") .. ".rbxmx",
        cleanName:gsub("_", " "):lower() .. ".rbxmx",
        haloName .. ".rbxmx",
        haloName:lower() .. ".rbxmx"
    }
    if match then
        table.insert(possibleNames, match.file .. ".rbxmx")
        table.insert(possibleNames, match.official .. ".rbxmx")
        table.insert(possibleNames, match.official:gsub("[^%w%s%-_]", "") .. ".rbxmx")
    end
    
    local rbxmxFile = nil
    for _, name in ipairs(possibleNames) do
        if isfile_safe(name) then
            rbxmxFile = name
            break
        elseif isfile_safe(name:gsub("%.rbxmx$", ".rbxlx")) then
            rbxmxFile = name:gsub("%.rbxmx$", ".rbxlx")
            break
        elseif isfile_safe(name .. ".rbxlx") then
            rbxmxFile = name .. ".rbxlx"
            break
        end
    end

    local loadedModel = nil
    if rbxmxFile then
        if getgenv().LoadedHaloCache[rbxmxFile] then
            loadedModel = getgenv().LoadedHaloCache[rbxmxFile]:Clone()
        else
            pcall(function()
                local assetUrl = getasset(rbxmxFile)
                local objs = game:GetObjects(assetUrl)
                if objs and objs[1] then
                    loadedModel = objs[1]
                    getgenv().LoadedHaloCache[rbxmxFile] = loadedModel:Clone()
                end
            end)
        end
    end
    

    if not loadedModel and writefile_safe and readfile_safe then
        local targetFileName = cleanName .. ".rbxmx"
        local githubUrl = "https://raw.githubusercontent.com/AikoHansen/RoyaleHighHalos/main/" .. targetFileName
        
        pcall(function()
            local success, content = pcall(function() return game:HttpGet(githubUrl) end)
            if success and content and #content > 1000 and not content:find("404") then
                writefile_safe(targetFileName, content)
                local assetUrl = getasset(targetFileName)
                local objs = game:GetObjects(assetUrl)
                if objs and objs[1] then
                    loadedModel = objs[1]
                    getgenv().LoadedHaloCache[targetFileName] = loadedModel:Clone()
                    print("[Spawner] Successfully downloaded and loaded " .. targetFileName .. " from GitHub!")
                end
            end
        end)
    end
    

    if not loadedModel and match and match.id then
        print("[Wave] Fetching '" .. haloName .. "' from Catalog: " .. tostring(match.id))
        

        pcall(function()
            local objs = game:GetObjects(match.id)
            if objs and objs[1] then
                loadedModel = objs[1]
            end
        end)
        

        if not loadedModel then
            local numericId = match.id:match("%d+")
            if numericId then
                pcall(function()
                    local objs = game:GetObjects("http://www.roblox.com/asset/?id=" .. numericId)
                    if objs and objs[1] then
                        loadedModel = objs[1]
                    end
                end)
            end
        end
        
        if loadedModel then

            task.spawn(function()
                pcall(function()
                    local cleanSave = createCleanModel(loadedModel)
                    if cleanSave then
                        local xml = serializeToRbxmx(cleanSave)
                        writefile_safe(cleanName .. ".rbxmx", xml)
                        cleanSave:Destroy()
                    else
                        local xml = serializeToRbxmx(loadedModel)
                        writefile_safe(cleanName .. ".rbxmx", xml)
                    end
                    print("[Wave] Cached catalog halo to disk: " .. cleanName .. ".rbxmx")
                end)
            end)
        end
    end
    
    if not loadedModel then
        print("[Wave] ERROR: Failed to load halo '" .. haloName .. "'!")
        return
    end
    

    local accessory = Instance.new("Accessory")
    accessory.Name = match and match.official or "ClientFakeHalo_" .. cleanName
    accessory:SetAttribute("IsAntigravityFake", true)
    
    for _, child in ipairs(loadedModel:GetChildren()) do
        child.Parent = accessory
    end
    loadedModel:Destroy()
    loadedModel = accessory
    
    local originCFrame = nil
    local originalHead = loadedModel:FindFirstChild("Head", true)
    local originalHandle = loadedModel:FindFirstChild("Handle", true)
    
    if originalHead and originalHead:IsA("BasePart") then
        originCFrame = originalHead.CFrame
    elseif originalHandle and originalHandle:IsA("BasePart") then
        originCFrame = originalHandle.CFrame
    else
        local sumPos = Vector3.new()
        local count = 0
        for _, part in ipairs(loadedModel:GetDescendants()) do
            if part:IsA("BasePart") and not isGuideBodyPart(part.Name) then
                sumPos = sumPos + part.Position
                count = count + 1
            end
        end
        originCFrame = (count > 0) and CFrame.new(sumPos / count) or CFrame.new()
    end
    
    if originalHandle and originalHandle:IsA("BasePart") then
        originalHandle.Name = "OriginalHandle"
    end
    

    local root = Instance.new("Part")
    root.Name = "Handle"
    root.Size = Vector3.new(0.01, 0.01, 0.01)
    root.Transparency = 1
    root.CanCollide = false
    root.Massless = true
    root.CFrame = originCFrame
    root.Parent = loadedModel
    

    local handleToWeld = originalHandle
    if not handleToWeld then
        for _, part in ipairs(loadedModel:GetDescendants()) do
            if part:IsA("BasePart") and part ~= root then
                handleToWeld = part
                break
            end
        end
    end
    if handleToWeld then
        local w = Instance.new("Weld")
        w.Name = "AntigravityAccessoryRootWeld"
        w.Part0 = root
        w.Part1 = handleToWeld
        w.C0 = CFrame.new(0, 0, 0)
        w.C1 = CFrame.new(0, 0, 0)
        w.Parent = root
    end
    

    for _, joint in ipairs(loadedModel:GetDescendants()) do
        if joint:IsA("JointInstance") then
            local p0, p1 = joint.Part0, joint.Part1
            local p0IsGuide = p0 and isGuideBodyPart(p0.Name)
            local p1IsGuide = p1 and isGuideBodyPart(p1.Name)
            
            if p0IsGuide and p1IsGuide then
                joint:Destroy()
            elseif p0IsGuide then
                joint.Part0 = root
            elseif p1IsGuide then
                joint.Part1 = root
            end
        end
    end
    
    for _, constraint in ipairs(loadedModel:GetDescendants()) do
        if constraint:IsA("WeldConstraint") then
            local p0, p1 = constraint.Part0, constraint.Part1
            local p0IsGuide = p0 and isGuideBodyPart(p0.Name)
            local p1IsGuide = p1 and isGuideBodyPart(p1.Name)
            
            if p0IsGuide and p1IsGuide then
                constraint:Destroy()
            elseif p0IsGuide then
                constraint.Part0 = root
            elseif p1IsGuide then
                constraint.Part1 = root
            end
        end
    end
    

    for _, part in ipairs(loadedModel:GetDescendants()) do
        if part:IsA("BasePart") and isGuideBodyPart(part.Name) and part ~= root then
            part:Destroy()
        end
    end
    

    for _, part in ipairs(loadedModel:GetDescendants()) do
        if part:IsA("BasePart") and part ~= root then
            part.Anchored = false
            part.CanCollide = false
            part.Massless = true
        end
    end
    

    root.Anchored = true
    root.CFrame = head.CFrame
    
    loadedModel.Parent = charModel
    

    local modelOffset = 0
    if cleanName == "Lucky_Halo_2021" then
        modelOffset = -0.65
    end
    
    table.insert(getgenv().ActiveClientHalosOrder, haloName)
    


    local animJoints = {}
    for _, joint in ipairs(loadedModel:GetDescendants()) do
        if joint:IsA("Motor6D") or joint:IsA("Motor") then
            pcall(function()
                joint.C0 = CFrame.new(joint.C0.Position)
            end)
            
            local shouldSpin = true
            local p1 = joint.Part1
            if p1 then
                local n = p1.Name:lower()
                local parentName = p1.Parent and p1.Parent.Name:lower() or ""
                if n:find("butterfly") or n:find("wing") or n:find("flower") or n:find("leaf") or n:find("leaves") 
                   or n:find("petal") or n:find("wreath") or n:find("bf") or n:find("branch") or n:find("cloud")
                   or n:find("star") or n:find("heart") or n:find("clover") or n:find("feather") or n:find("candle")
                   or n:find("web") or n:find("chain") or n:find("vine") or n:find("bow") or n:find("arrow")
                   or n == "1" or n == "3" or n == "4" or n == "clouds"
                   or parentName:find("cloud") or parentName:find("wing") or parentName:find("feather") then
                    shouldSpin = false
                end
            end
            if shouldSpin then
                animJoints[joint] = joint.C0
            end
        end
    end
    
    getgenv().ActiveClientHalos[haloName] = {
        Model = loadedModel,
        HeightOffset = modelOffset,
        CenterOffset = Vector3.new(0, 0, 0),
        Scale = 1.0
    }
    

    local startTick = tick()
    local animConn = RunService.RenderStepped:Connect(function()
        local elapsed = tick() - startTick
        local data = getgenv().ActiveClientHalos[haloName]
        if not data then return end
        
        local idx = 0
        for i, name in ipairs(getgenv().ActiveClientHalosOrder) do
            if name == haloName then
                idx = i
                break
            end
        end
        
        local currentOffset = data.HeightOffset or 0
        local stackOffset = (idx > 0 and (idx - 1) * 0.6) or 0
        
        pcall(function()
            local bobOffset = math.sin(elapsed * 1.6) * 0.12
            

            local lookVector = head.CFrame.LookVector
            local horizontalLook = Vector3.new(lookVector.X, 0, lookVector.Z).Unit
            local targetRotation = CFrame.lookAt(Vector3.new(), horizontalLook)
            
            local targetPos = head.Position + Vector3.new(0, 1.8 + bobOffset + stackOffset + currentOffset, 0)
            root.CFrame = CFrame.new(targetPos) * targetRotation
        end)
        
        pcall(function()
            for joint, originalC0 in pairs(animJoints) do
                joint.C0 = originalC0 * CFrame.Angles(0, elapsed * 0.8, 0)
            end
        end)
    end)
    
    getgenv().ActiveClientHalos[haloName].Connection = animConn
    print("[Wave] Equipped: " .. haloName)
    pcall(rebuildColorPanel)
end


local function scanAndSaveServerHalos()
    local savedCount = 0
    local foundHalos = {}
    
    local function isHaloInstance(inst)
        if not (inst:IsA("Model") or inst:IsA("Accessory")) then return false end
        local n = inst.Name:lower()
        

        if n:find("body") or n:find("package") or n:find("pants") or n:find("shirt") or n:find("face") then
            return false
        end
        

        if inst:IsA("Model") and not inst:FindFirstChildOfClass("BasePart", true) then
            return false
        end
        

        return true
    end
    
    local function processHalo(inst, ownerName)
        local match = findBestHaloMatch(inst.Name)
        local targetFile = match and match.file or inst.Name:gsub("%s+", "_"):gsub("[^%w_]", "")
        local filename = targetFile .. ".rbxmx"
        
        if foundHalos[filename] then return end
        foundHalos[filename] = true
        

        local targetLower = targetFile:lower()
        if targetLower:find("diamond_halo") or targetLower:find("diamond_heart") then
            return
        end
        

        pcall(function()
            local delfile_safe = delfile or (getgenv and getgenv().delfile)
            if delfile_safe then
                delfile_safe(filename)
                delfile_safe(targetFile .. ".rbxlx")
                delfile_safe(targetFile .. ".rbxmx.rbxlx")
            end
        end)
        


        local saveModel = nil
        if not ownerName and match and match.id then
            print("[Wave Auto-Saver] Fetching original clean '" .. match.official .. "' from Catalog...")
            

            pcall(function()
                local objs = game:GetObjects(match.id)
                if objs and objs[1] then
                    saveModel = createCleanModel(objs[1])
                end
            end)
            

            if not saveModel then
                local numericId = match.id:match("%d+")
                if numericId then
                    pcall(function()
                        local objs = game:GetObjects("http://www.roblox.com/asset/?id=" .. numericId)
                        if objs and objs[1] then
                            saveModel = createCleanModel(objs[1])
                        end
                    end)
                end
            end
        end
        

        if not saveModel then
            print("[Wave Auto-Saver] Catalog fetch failed/not found, saving player's in-game model instead...")
            saveModel = createCleanModel(inst)
        end
        
        if not saveModel then
            print("[Wave Auto-Saver] Failed to create clean model for " .. inst.Name)
            return
        end
        
        pcall(function()
            local structStr = "Halo Structure Dump for " .. inst.Name .. "\n"
            local function dump(obj, indent)
                structStr = structStr .. string.rep("  ", indent) .. obj.Name .. " (" .. obj.ClassName .. ")"
                if obj:IsA("BasePart") then
                    structStr = structStr .. " - Trans: " .. tostring(obj.Transparency) .. " - Size: " .. tostring(obj.Size)
                elseif obj:IsA("SpecialMesh") then
                    structStr = structStr .. " - MeshId: " .. tostring(obj.MeshId) .. " - TextureId: " .. tostring(obj.TextureId)
                end
                structStr = structStr .. "\n"
                for _, child in ipairs(obj:GetChildren()) do
                    dump(child, indent + 1)
                end
            end
            dump(inst, 0)
            
            if inst.Parent then
                structStr = structStr .. "\n\n=== Character Children ===\n"
                for _, child in ipairs(inst.Parent:GetChildren()) do
                    structStr = structStr .. child.Name .. " (" .. child.ClassName .. ")\n"
                end
            end
            
            local writefile_safe = writefile or (getgenv and getgenv().writefile)
            if writefile_safe then
                writefile_safe("halo_structure.txt", structStr)
                print("[Wave Debugger] Dumped halo & character structure to halo_structure.txt")
            end
        end)

        local savedOk = false
        if synsaveinstance then
            local success = pcall(function()
                synsaveinstance({
                    mode = "custom",
                    noscripts = true,
                    FilePath = targetFile .. ".rbxmx",
                    ExtraInstances = {saveModel}
                })
            end)
            if success then
                savedOk = true
                print("[Wave Auto-Saver] Saved halo '" .. inst.Name .. "' from player '" .. ownerName .. "' via UniversalSynSaveInstance: " .. filename)
            end
        end
        
        if not savedOk then
            local success, xml = pcall(function() return serializeToRbxmx(saveModel) end)
            if success and xml then
                pcall(function() writefile_safe(filename, xml) end)
                print("[Wave Auto-Saver] Saved halo '" .. inst.Name .. "' from player '" .. ownerName .. "' via XML Serializer: " .. filename)
                savedOk = true
            end
        end
        


        pcall(function() saveModel:Destroy() end)
        
        if savedOk then savedCount = savedCount + 1 end
    end
    
    local eqStorage = workspace:FindFirstChild("EquippedStorage")
    if eqStorage then
        local accFolder = eqStorage:FindFirstChild("Accessories") or eqStorage
        for _, folder in ipairs(accFolder:GetChildren()) do
            for _, item in ipairs(folder:GetChildren()) do
                if isHaloInstance(item) then processHalo(item, folder.Name) end
            end
        end
    end
    
    for _, ply in ipairs(Players:GetPlayers()) do
        local char = ply.Character
        if char then
            for _, item in ipairs(char:GetChildren()) do
                if isHaloInstance(item) then
                    processHalo(item, ply.Name)
                elseif item:IsA("Model") or item:IsA("Accessory") then
                    for _, sub in ipairs(item:GetDescendants()) do
                        if isHaloInstance(sub) then processHalo(sub, ply.Name) end
                    end
                end
            end
        end
    end
    
    return savedCount
end


local function updateFakeItems()
    local bodiceFrame = findBodiceFrame()
    if not bodiceFrame then return end
    local parent = bodiceFrame.Parent
    
    for _, item in ipairs(getgenv().RequestedFakeItems) do
        local existing = nil
        for _, child in ipairs(parent:GetChildren()) do
            if child.Name == item.Name and child:GetAttribute("IsAntigravityFake") then
                existing = child
                break
            end
        end
        
        if not existing then
            local clone = bodiceFrame:Clone()
            clone.Name = item.Name
            clone:SetAttribute("IsAntigravityFake", true)
            
            for _, child in ipairs(clone:GetDescendants()) do
                if child:IsA("LocalScript") or child:IsA("Script") then child.Disabled = true end
            end
            
            local cloneImg = clone:FindFirstChild("Image") or clone:FindFirstChildOfClass("ImageLabel") or clone:FindFirstChildOfClass("ImageButton")
            if cloneImg then
                cloneImg.Image = item.Image
                cloneImg.ImageRectOffset = Vector2.new(0, 0)
                cloneImg.ImageRectSize = Vector2.new(0, 0)
                cloneImg.ImageColor3 = Color3.fromRGB(255, 255, 255)
            end
            
            local assetNameVal = clone:FindFirstChild("AssetName")
            if assetNameVal and assetNameVal:IsA("StringValue") then assetNameVal.Value = item.Name end
            
            for _, child in ipairs(clone:GetChildren()) do
                if child:IsA("TextLabel") or child:IsA("TextButton") then child.Text = item.Name end
            end
            
            task.delay(0.5, function()
                if not clone or not clone.Parent then return end
                local clickBtn = clone:IsA("GuiButton") and clone or clone:FindFirstChildOfClass("GuiButton") or clone:FindFirstChild("Button", true)
                if clickBtn then
                    clickBtn.MouseButton1Click:Connect(function()
                        equipHalo3D(item.Name)
                    end)
                end
            end)
            
            clone.Parent = parent
        end
    end
end

if getgenv().FakeItemsLoopRunning then
    getgenv().FakeItemsLoopRunning = false
end
task.wait(0.2)

task.spawn(function()
    getgenv().FakeItemsLoopRunning = true
    while getgenv().FakeItemsLoopRunning do
        pcall(updateFakeItems)
        task.wait(1.0)
    end
end)


local oldGui
pcall(function() oldGui = game:GetService("CoreGui"):FindFirstChild("AntigravitySimpleHaloGui") end)
oldGui = oldGui or playerGui:FindFirstChild("AntigravitySimpleHaloGui")
if oldGui then pcall(function() oldGui:Destroy() end) end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AntigravitySimpleHaloGui"
pcall(function() screenGui.Parent = game:GetService("CoreGui") end)
if not screenGui.Parent then screenGui.Parent = playerGui end

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 480, 0, 50)
    mainFrame.Position = UDim2.new(0.5, -240, 0, 20)
    mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    mainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    mainFrame.BorderSizePixel = 1
    mainFrame.Parent = screenGui
    
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
    textBox.TextSize = 22
    textBox.ClearTextOnFocus = false
    textBox.TextXAlignment = Enum.TextXAlignment.Left
    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 10)
    padding.Parent = textBox
    textBox.Parent = mainFrame
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.20, 0, 1, 0)
    button.Position = UDim2.new(0.55, 0, 0, 0)
    button.Text = "Request!"
    button.TextColor3 = Color3.fromRGB(0, 0, 0)
    button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    button.BorderColor3 = Color3.fromRGB(0, 0, 0)
    button.BorderSizePixel = 1
    button.Font = Enum.Font.SourceSans
    button.TextSize = 18
    button.Parent = mainFrame
    
    local scanButton = Instance.new("TextButton")
    scanButton.Size = UDim2.new(0.25, 0, 1, 0)
    scanButton.Position = UDim2.new(0.75, 0, 0, 0)
    scanButton.Text = "Scan Server!"
    scanButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    scanButton.BackgroundColor3 = Color3.fromRGB(50, 150, 250)
    scanButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    scanButton.BorderSizePixel = 1
    scanButton.Font = Enum.Font.SourceSansBold
    scanButton.TextSize = 16
    scanButton.Parent = mainFrame
    
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 15, 0, 15)
    closeBtn.Position = UDim2.new(1, -12, 0, -8)
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.fromRGB(200, 50, 50)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Font = Enum.Font.SourceSansBold
    closeBtn.TextSize = 16
    closeBtn.Parent = mainFrame
closeBtn.MouseButton1Click:Connect(function()
    for name, active in pairs(getgenv().ActiveClientHalos) do
        if active.Connection then active.Connection:Disconnect() end
        if active.Model then active.Model:Destroy() end
    end
    getgenv().ActiveClientHalos = {}
    getgenv().ActiveClientHalosOrder = {}
    screenGui:Destroy()
end)


local dragToggle = false
local dragStart, startPos
local function startDrag(input)
    dragToggle = true
    dragStart = input.Position
    startPos = mainFrame.Position
    local connection
    connection = input.Changed:Connect(function()
        if input.UserInputState == Enum.UserInputState.End then
            dragToggle = false
            connection:Disconnect()
        end
    end)
end
mainFrame.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then startDrag(input) end
end)
button.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then startDrag(input) end
end)
scanButton.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then startDrag(input) end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragToggle and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
        if colorPanel then
            colorPanel.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y + 60
            )
        end
    end
end)


local buttonStart = Vector2.new()
button.MouseButton1Down:Connect(function() buttonStart = UserInputService:GetMouseLocation() end)
button.MouseButton1Up:Connect(function()
    local buttonEnd = UserInputService:GetMouseLocation()
    if (buttonEnd - buttonStart).Magnitude < 8 then
        if not getasset then return end
        local nameInput = textBox.Text
        if nameInput == "" then return end
        local bodiceFrame = findBodiceFrame()
        if not bodiceFrame then
            button.Text = "No Inventory!"
            task.wait(1.5)
            button.Text = "Request!"
            return
        end
        local match = findBestHaloMatch(nameInput)
        if not match then
            button.Text = "Unsuccessful!"
            task.wait(1)
            button.Text = "Request!"
            return
        end
        local officialName = match.official
        local imageId = match.id
        for idx, item in ipairs(getgenv().RequestedFakeItems) do
            if item.Name:lower() == officialName:lower() then
                table.remove(getgenv().RequestedFakeItems, idx)
                break
            end
        end
        table.insert(getgenv().RequestedFakeItems, {Name = officialName, Image = imageId})
        print("[Wave] Success! Card added: " .. officialName)
        button.Text = "Saved!"
        task.wait(1)
        button.Text = "Request!"
    end
end)


local scanStart = Vector2.new()
scanButton.MouseButton1Down:Connect(function() scanStart = UserInputService:GetMouseLocation() end)
scanButton.MouseButton1Up:Connect(function()
    local scanEnd = UserInputService:GetMouseLocation()
    if (scanEnd - scanStart).Magnitude < 8 then
        scanButton.Text = "Scanning..."
        local count = scanAndSaveServerHalos()
        scanButton.Text = "Saved (" .. tostring(count) .. ")"
        task.wait(1.5)
        scanButton.Text = "Scan Server!"
    end
end)


local colorPanelOld
pcall(function() colorPanelOld = game:GetService("CoreGui"):FindFirstChild("AntigravityColorPickerGui") end)
colorPanelOld = colorPanelOld or playerGui:FindFirstChild("AntigravityColorPickerGui")
if colorPanelOld then pcall(function() colorPanelOld:Destroy() end) end

local activeTab = nil

function getFriendlyPartName(partName, haloName)
    local cleanName = partName:gsub("%d+$", "")
    if cleanName == "" then cleanName = partName end
    local lowerClean = cleanName:lower()
    local lowerHalo = haloName:lower()
    if lowerHalo:find("lucky") and lowerHalo:find("2021") then
        if partName == "1" then return "Clouds"
        elseif partName == "2" then return "Rainbow Swirl"
        elseif partName == "3" then return "Clovers / Vines"
        elseif partName == "4" then return "Stars"
        end
    end
    if tonumber(partName) then return "Layer " .. partName end
    if lowerClean == "cloud" or lowerClean == "clouds" then return "Clouds"
    elseif lowerClean == "light" or lowerClean == "lights" or lowerClean == "glow" then return "Lights / Glow"
    elseif lowerClean == "ring" or lowerClean == "torus" or lowerClean == "hoop" or lowerClean == "band" then return "Ring / Band"
    elseif lowerClean == "star" or lowerClean == "stars" then return "Stars"
    elseif lowerClean == "wing" or lowerClean == "wings" then return "Wings"
    elseif lowerClean == "leaf" or lowerClean == "leaves" or lowerClean == "vine" then return "Leaves / Vines"
    elseif lowerClean == "flower" or lowerClean == "flowers" or lowerClean == "blossom" then return "Flowers"
    elseif lowerClean == "heart" or lowerClean == "hearts" then return "Hearts"
    end
    return cleanName:gsub("^%l", string.upper)
end

function getActiveCustomizerHalo()
    local selected = getgenv().SelectedCustomizerHalo
    if selected and getgenv().ActiveClientHalos[selected] then
        return selected
    end
    for name, _ in pairs(getgenv().ActiveClientHalos) do
        getgenv().SelectedCustomizerHalo = name
        return name
    end
    getgenv().SelectedCustomizerHalo = nil
    return nil
end

function rebuildColorPanel()
    if colorPanel then
        pcall(function() colorPanel:Destroy() end)
        colorPanel = nil
    end
    
    local activeHalo = getActiveCustomizerHalo()
    

    local equippedCount = 0
    local equippedList = {}
    for name, data in pairs(getgenv().ActiveClientHalos) do
        equippedCount = equippedCount + 1
        table.insert(equippedList, name)
    end
    
    if equippedCount == 0 then return end
    
    colorPanel = Instance.new("Frame")
    colorPanel.Name = "AntigravityColorPickerGui"
    colorPanel.Size = UDim2.new(0, 480, 0, 265)
    colorPanel.Position = UDim2.new(mainFrame.Position.X.Scale, mainFrame.Position.X.Offset, mainFrame.Position.Y.Scale, mainFrame.Position.Y.Offset + 60)
    colorPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    colorPanel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    colorPanel.BorderSizePixel = 1
    colorPanel.Parent = screenGui
    
    local panelTitle = Instance.new("TextLabel")
    panelTitle.Size = UDim2.new(1, 0, 0, 25)
    panelTitle.Position = UDim2.new(0, 0, 0, 0)
    panelTitle.Text = "🎨 Halo Customizer (Height, Size & HSV Color Wheels)"
    panelTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    panelTitle.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    panelTitle.BorderSizePixel = 0
    panelTitle.Font = Enum.Font.SourceSansBold
    panelTitle.TextSize = 14
    panelTitle.Parent = colorPanel
    

    local tabContainer = Instance.new("Frame")
    tabContainer.Size = UDim2.new(1, 0, 0, 30)
    tabContainer.Position = UDim2.new(0, 0, 0, 25)
    tabContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    tabContainer.BorderSizePixel = 0
    tabContainer.Parent = colorPanel
    
    local tabLayout = Instance.new("UIListLayout")
    tabLayout.FillDirection = Enum.FillDirection.Horizontal
    tabLayout.Padding = UDim.new(0, 4)
    tabLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    tabLayout.Parent = tabContainer
    
    local tabPadding = Instance.new("UIPadding")
    tabPadding.PaddingLeft = UDim.new(0, 6)
    tabPadding.PaddingRight = UDim.new(0, 6)
    tabPadding.Parent = tabContainer
    

    for _, name in ipairs(equippedList) do
        local tabBtn = Instance.new("TextButton")
        tabBtn.Size = UDim2.new(0, 110, 0, 24)
        local cleanLabel = name:gsub("Halo", ""):gsub("%d+$", ""):gsub("[^%w%s]", "")
        tabBtn.Text = cleanLabel
        tabBtn.TextSize = 11
        tabBtn.Font = Enum.Font.SourceSansBold
        
        if name == activeHalo then
            tabBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 250)
            tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        else
            tabBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
            tabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        end
        
        tabBtn.BorderSizePixel = 0
        tabBtn.Parent = tabContainer
        local tCorner = Instance.new("UICorner")
        tCorner.CornerRadius = UDim.new(0, 4)
        tCorner.Parent = tabBtn
        
        tabBtn.MouseButton1Click:Connect(function()
            getgenv().SelectedCustomizerHalo = name
            rebuildColorPanel()
        end)
    end
    
    if not activeHalo then
        colorPanel.Visible = false
        return
    end
    
    local scrollContainer = Instance.new("ScrollingFrame")
    scrollContainer.Size = UDim2.new(1, 0, 1, -55)
    scrollContainer.Position = UDim2.new(0, 0, 0, 55)
    scrollContainer.BackgroundTransparency = 1
    scrollContainer.BorderSizePixel = 0
    scrollContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollContainer.ScrollBarThickness = 6
    scrollContainer.Parent = colorPanel
    
    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, 6)
    listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    listLayout.Parent = scrollContainer
    
    local active = getgenv().ActiveClientHalos[activeHalo]
    local model = active.Model
    if model then

        local adjFrame = Instance.new("Frame")
        adjFrame.Size = UDim2.new(0.95, 0, 0, 35)
        adjFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        adjFrame.BorderSizePixel = 0
        adjFrame.Parent = scrollContainer
        Instance.new("UICorner", adjFrame).CornerRadius = UDim.new(0, 4)
        
        local hLabel = Instance.new("TextLabel")
        hLabel.Size = UDim2.new(0.18, 0, 1, 0)
        hLabel.Position = UDim2.new(0, 8, 0, 0)
        hLabel.Text = "Height: " .. string.format("%.2f", active.HeightOffset)
        hLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        hLabel.Font = Enum.Font.SourceSans
        hLabel.TextSize = 12
        hLabel.BackgroundTransparency = 1
        hLabel.Parent = adjFrame
        
        local hDown = Instance.new("TextButton")
        hDown.Size = UDim2.new(0, 25, 0, 25)
        hDown.Position = UDim2.new(0.18, 10, 0.5, -12)
        hDown.Text = "-"
        hDown.TextColor3 = Color3.fromRGB(255, 255, 255)
        hDown.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
        hDown.BorderSizePixel = 0
        hDown.Font = Enum.Font.SourceSansBold
        hDown.TextSize = 16
        hDown.Parent = adjFrame
        Instance.new("UICorner", hDown).CornerRadius = UDim.new(0, 4)
        
        local hUp = Instance.new("TextButton")
        hUp.Size = UDim2.new(0, 25, 0, 25)
        hUp.Position = UDim2.new(0.18, 40, 0.5, -12)
        hUp.Text = "+"
        hUp.TextColor3 = Color3.fromRGB(255, 255, 255)
        hUp.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
        hUp.BorderSizePixel = 0
        hUp.Font = Enum.Font.SourceSansBold
        hUp.TextSize = 16
        hUp.Parent = adjFrame
        Instance.new("UICorner", hUp).CornerRadius = UDim.new(0, 4)
        
        hDown.MouseButton1Click:Connect(function()
            active.HeightOffset = active.HeightOffset - 0.05
            hLabel.Text = "Height: " .. string.format("%.2f", active.HeightOffset)
        end)
        hUp.MouseButton1Click:Connect(function()
            active.HeightOffset = active.HeightOffset + 0.05
            hLabel.Text = "Height: " .. string.format("%.2f", active.HeightOffset)
        end)
        
        local sLabel = Instance.new("TextLabel")
        sLabel.Size = UDim2.new(0.18, 0, 1, 0)
        sLabel.Position = UDim2.new(0.5, 8, 0, 0)
        sLabel.Text = "Scale: " .. string.format("%.2f", active.Scale)
        sLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        sLabel.Font = Enum.Font.SourceSans
        sLabel.TextSize = 12
        sLabel.BackgroundTransparency = 1
        sLabel.Parent = adjFrame
        
        local sDown = Instance.new("TextButton")
        sDown.Size = UDim2.new(0, 25, 0, 25)
        sDown.Position = UDim2.new(0.5, 75, 0.5, -12)
        sDown.Text = "-"
        sDown.TextColor3 = Color3.fromRGB(255, 255, 255)
        sDown.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
        sDown.BorderSizePixel = 0
        sDown.Font = Enum.Font.SourceSansBold
        sDown.TextSize = 16
        sDown.Parent = adjFrame
        Instance.new("UICorner", sDown).CornerRadius = UDim.new(0, 4)
        
        local sUp = Instance.new("TextButton")
        sUp.Size = UDim2.new(0, 25, 0, 25)
        sUp.Position = UDim2.new(0.5, 105, 0.5, -12)
        sUp.Text = "+"
        sUp.TextColor3 = Color3.fromRGB(255, 255, 255)
        sUp.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
        sUp.BorderSizePixel = 0
        sUp.Font = Enum.Font.SourceSansBold
        sUp.TextSize = 16
        sUp.Parent = adjFrame
        Instance.new("UICorner", sUp).CornerRadius = UDim.new(0, 4)
        
        sDown.MouseButton1Click:Connect(function()
            local oldScale = active.Scale
            active.Scale = math.max(0.2, active.Scale - 0.05)
            sLabel.Text = "Scale: " .. string.format("%.2f", active.Scale)
            
            pcall(function()
                local rootPart = model:FindFirstChild("Handle")
                if rootPart then
                    local temp = Instance.new("Model")
                    temp.PrimaryPart = rootPart
                    for _, child in ipairs(model:GetChildren()) do
                        child.Parent = temp
                    end
                    temp:ScaleTo(active.Scale / oldScale)
                    for _, child in ipairs(temp:GetChildren()) do
                        child.Parent = model
                    end
                    temp:Destroy()
                end
            end)
        end)
        sUp.MouseButton1Click:Connect(function()
            local oldScale = active.Scale
            active.Scale = math.min(3.0, active.Scale + 0.05)
            sLabel.Text = "Scale: " .. string.format("%.2f", active.Scale)
            
            pcall(function()
                local rootPart = model:FindFirstChild("Handle")
                if rootPart then
                    local temp = Instance.new("Model")
                    temp.PrimaryPart = rootPart
                    for _, child in ipairs(model:GetChildren()) do
                        child.Parent = temp
                    end
                    temp:ScaleTo(active.Scale / oldScale)
                    for _, child in ipairs(temp:GetChildren()) do
                        child.Parent = model
                    end
                    temp:Destroy()
                end
            end)
        end)
        

        local uniquePartNames = {}
        for _, desc in ipairs(model:GetDescendants()) do
            local isInvisibleRoot = (desc.Name == "Handle" and desc.Size.Magnitude < 0.1 and desc.Transparency == 1)
            if desc:IsA("BasePart") and not isInvisibleRoot and not desc.Name:find("Weld") and not desc.Name:find("Attachment") then

                if desc.Transparency < 1 or desc:IsA("MeshPart") or desc:FindFirstChildOfClass("SpecialMesh") then
                    local clean = getFriendlyPartName(desc.Name, activeHalo)
                    if not uniquePartNames[clean] then uniquePartNames[clean] = {} end
                    table.insert(uniquePartNames[clean], desc)
                end
            end
        end
        

        for cleanName, parts in pairs(uniquePartNames) do
            local rowFrame = Instance.new("Frame")
            rowFrame.Size = UDim2.new(0.95, 0, 0, 40)
            rowFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
            rowFrame.BorderSizePixel = 0
            rowFrame.ClipsDescendants = true
            rowFrame.Parent = scrollContainer
            Instance.new("UICorner", rowFrame).CornerRadius = UDim.new(0, 4)
            
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Size = UDim2.new(0.6, 0, 0, 30)
            nameLabel.Position = UDim2.new(0, 8, 0, 5)
            nameLabel.Text = cleanName
            nameLabel.TextColor3 = Color3.fromRGB(230, 230, 235)
            nameLabel.Font = Enum.Font.SourceSansBold
            nameLabel.TextSize = 14
            nameLabel.TextXAlignment = Enum.TextXAlignment.Left
            nameLabel.BackgroundTransparency = 1
            nameLabel.Parent = rowFrame
            
            local preview = Instance.new("TextButton")
            preview.Size = UDim2.new(0, 30, 0, 30)
            preview.Position = UDim2.new(1, -38, 0, 5)
            preview.BackgroundColor3 = parts[1] and parts[1].Color or Color3.fromRGB(255, 255, 255)
            preview.Text = ""
            preview.Parent = rowFrame
            Instance.new("UICorner", preview).CornerRadius = UDim.new(0, 4)
            
            local wheelFrame = Instance.new("Frame")
            wheelFrame.Size = UDim2.new(0, 100, 0, 100)
            wheelFrame.Position = UDim2.new(0.5, -50, 0, 45)
            wheelFrame.BackgroundTransparency = 1
            wheelFrame.Parent = rowFrame
            
            local wheelImg = Instance.new("ImageLabel")
            wheelImg.Size = UDim2.new(1, 0, 1, 0)
            wheelImg.Image = "rbxassetid://415583266" -- Stable public color wheel ID
            wheelImg.BackgroundTransparency = 1
            wheelImg.Active = true
            wheelImg.Parent = wheelFrame
            
            local selector = Instance.new("Frame")
            selector.Size = UDim2.new(0, 8, 0, 8)
            selector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            selector.BorderColor3 = Color3.fromRGB(0, 0, 0)
            selector.BorderSizePixel = 1
            selector.Position = UDim2.new(0.5, -4, 0.5, -4)
            selector.ZIndex = 5
            selector.Parent = wheelImg
            Instance.new("UICorner", selector).CornerRadius = UDim.new(1, 0)
            
            local function applyColor(color)
                preview.BackgroundColor3 = color
                for _, part in ipairs(parts) do
                    pcall(function()
                        part.Color = color
                        for _, child in ipairs(part:GetDescendants()) do
                            if child:IsA("Decal") or child:IsA("Texture") then 
                                child.Color3 = color
                            elseif child:IsA("SpecialMesh") then 
                                child.VertexColor = Vector3.new(color.R, color.G, color.B)
                            elseif child:IsA("ParticleEmitter") or child:IsA("Beam") or child:IsA("Trail") then
                                child.Color = ColorSequence.new(color)
                            elseif child:IsA("Light") then
                                child.Color = color
                            end
                        end
                    end)
                end
            end

            local isPicking = false
            local function updateColor(input)
                local localX = input.Position.X - wheelImg.AbsolutePosition.X
                local localY = input.Position.Y - wheelImg.AbsolutePosition.Y
                localX = math.clamp(localX, 0, 100)
                localY = math.clamp(localY, 0, 100)
                local dx = localX - 50
                local dy = localY - 50
                local r = math.sqrt(dx*dx + dy*dy)
                local saturation = math.clamp(r / 50, 0, 1)
                local theta = math.atan2(dy, dx)
                local hue = (theta / (2 * math.pi)) % 1
                local color = Color3.fromHSV(hue, saturation, 1.0)
                selector.Position = UDim2.new(0, localX - 4, 0, localY - 4)
                applyColor(color)
            end
            
            wheelImg.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    isPicking = true
                    updateColor(input)
                end
            end)
            UserInputService.InputChanged:Connect(function(input)
                if isPicking and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    updateColor(input)
                end
            end)
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then isPicking = false end
            end)
            

            local presetScroll = Instance.new("ScrollingFrame")
            presetScroll.Size = UDim2.new(1, -20, 0, 32)
            presetScroll.Position = UDim2.new(0, 10, 0, 150)
            presetScroll.BackgroundTransparency = 1
            presetScroll.BorderSizePixel = 0
            presetScroll.CanvasSize = UDim2.new(0, 15 * 28 + 10, 0, 0)
            presetScroll.ScrollBarThickness = 3
            presetScroll.Parent = rowFrame
            
            local pLayout = Instance.new("UIListLayout")
            pLayout.FillDirection = Enum.FillDirection.Horizontal
            pLayout.Padding = UDim.new(0, 4)
            pLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            pLayout.Parent = presetScroll
            
            local presets = {
                Color3.fromRGB(255, 255, 255), -- White
                Color3.fromRGB(200, 200, 200), -- Light Grey
                Color3.fromRGB(120, 120, 120), -- Grey
                Color3.fromRGB(50, 50, 50),   -- Dark Grey
                Color3.fromRGB(0, 0, 0),       -- Black
                Color3.fromRGB(255, 100, 100), -- Light Red
                Color3.fromRGB(150, 0, 0),     -- Dark Red
                Color3.fromRGB(100, 255, 100), -- Light Green
                Color3.fromRGB(0, 120, 0),     -- Dark Green
                Color3.fromRGB(100, 100, 255), -- Light Blue
                Color3.fromRGB(0, 0, 150),     -- Dark Blue
                Color3.fromRGB(255, 200, 50),  -- Gold
                Color3.fromRGB(255, 100, 200), -- Pink
                Color3.fromRGB(150, 50, 150),  -- Purple
                Color3.fromRGB(0, 255, 255)    -- Cyan
            }
            
            for _, colorVal in ipairs(presets) do
                local pBtn = Instance.new("TextButton")
                pBtn.Size = UDim2.new(0, 24, 0, 24)
                pBtn.BackgroundColor3 = colorVal
                pBtn.Text = ""
                pBtn.Parent = presetScroll
                local pCorner = Instance.new("UICorner")
                pCorner.CornerRadius = UDim.new(1, 0)
                pCorner.Parent = pBtn
                
                pBtn.MouseButton1Click:Connect(function()
                    applyColor(colorVal)
                end)
            end
            
            local isExpanded = false
            preview.MouseButton1Click:Connect(function()
                isExpanded = not isExpanded
                local targetHeight = isExpanded and 190 or 40
                local tween = TweenService:Create(rowFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0.95, 0, 0, targetHeight)})
                tween:Play()
                task.wait(0.2)
                local totalHeight = 0
                for _, child in ipairs(scrollContainer:GetChildren()) do
                    if child:IsA("Frame") then totalHeight = totalHeight + child.Size.Y.Offset + 6 end
                end
                scrollContainer.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
            end)
        end
    end
    
    local totalHeight = 0
    for _, child in ipairs(scrollContainer:GetChildren()) do
        if child:IsA("Frame") then totalHeight = totalHeight + child.Size.Y.Offset + 6 end
    end
    scrollContainer.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
    
    if activeHalo then 
        colorPanel.Visible = mainFrame.Visible 
    else 
        colorPanel.Visible = false 
    end
end

pcall(rebuildColorPanel)




task.spawn(function()
    while true do
        task.wait(1.0)
        local char = player.Character
        if char then
            local officialColor = nil
            

            for _, child in ipairs(char:GetChildren()) do
                local isFake = child:GetAttribute("IsAntigravityFake") or child.Name:find("ClientFakeHalo")
                if (child:IsA("Accessory") or child:IsA("Model")) and not isFake then
                    local handle = child:FindFirstChild("Handle", true) or child:FindFirstChildOfClass("BasePart", true)
                    if handle and handle:IsA("BasePart") then

                        if handle.Transparency < 1 and handle.Color ~= Color3.fromRGB(163, 162, 165) then
                            officialColor = handle.Color
                            break
                        end
                    end
                end
            end
            

            if officialColor then
                for _, data in pairs(getgenv().ActiveClientHalos) do
                    local model = data.Model
                    if model then
                        for _, part in ipairs(model:GetDescendants()) do
                            if part:IsA("BasePart") and part.Name ~= "Handle" then
                                pcall(function()
                                    if part.Color ~= officialColor then
                                        part.Color = officialColor
                                        

                                        for _, sub in ipairs(part:GetDescendants()) do
                                            if sub:IsA("Decal") or sub:IsA("Texture") then
                                                sub.Color3 = officialColor
                                            elseif sub:IsA("SpecialMesh") then
                                                sub.VertexColor = Vector3.new(officialColor.R, officialColor.G, officialColor.B)
                                            elseif sub:IsA("ParticleEmitter") or sub:IsA("Beam") or sub:IsA("Trail") then
                                                sub.Color = ColorSequence.new(officialColor)
                                            elseif sub:IsA("Light") then
                                                sub.Color = officialColor
                                            end
                                        end
                                    end
                                end)
                            end
                        end
                    end
                end
            end
        end
    end
end)

print("[Antigravity] Spawner reloaded successfully with USSI!")


UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        local visible = not mainFrame.Visible
        mainFrame.Visible = visible
        if colorPanel then
            local hasActive = false
            for _, _ in pairs(getgenv().ActiveClientHalos) do
                hasActive = true
                break
            end
            colorPanel.Visible = visible and hasActive
        end
    end
end)




print("[Antigravity] Spawner script fully loaded without spoofer code.")
