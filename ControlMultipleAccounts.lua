--//Variables\\--
local stopPerm = false
local plr = game.Players.LocalPlayer

local accounts = {
    {"roooooo_4", "master"},
    {"UnlimitedRBLX", "master"},
    {"BIG_CAT658", "master"},
    {"spf96eeW3pnm9oWf", "follower"},
    {"xoYn5Tpw0vuYbEkb", "follower"},
    {"jKwXJcq3GvUSRR9t", "follower"},
    {"gwvVaO4ETm4mm6Jl", "follower"},
    {"ePhf7b3uSzMaBuax", "master"},
    {"lQs0nTNvaX8IN3su", "follower"},
    {"Hh8FEEVRpOGPpmFG", "follower"},
    {"PvSewUstTH7qMaHO", "follower"},
    {"poVy86notyfTaIkL", "follower"},
    {"2Gkgi7Iw5Se1zKO3", "follower"},
    {"GPVI5jdXhWjSsIrO", "follower"},
    {"J8h4pUz8JxWjpxsq", "follower"},
    {"aFP0QRUTnM9MY0Ew", "follower"},
    {"lQs0nTNvaX8IN3su", "follower"},
    {"o32m2172nNRcVmjT", "follower"},
    {"ePhf7b3uSzMaBuax", "follower"},
    {"xoYn5Tpw0vuYbEkb", "follower"},
    {"Hh8FEEVRpOGPpmFG", "follower"},
    {"PvSewUstTH7qMaHO", "follower"},
    {"poVy86notyfTaIkL", "follower"},
    {"5193TlUs3WUqfH7J", "follower"},
    {"nZhCJePSInu7yYSK", "follower"},
    {"gwvVaO4ETm4mm6Jl", "follower"},
    {"0VpAlhBamqup0W4e", "follower"},
    {"DJJsVmtZecthjnqM", "follower"},
    {"AiLrPbvulL7A396P", "follower"},
    {"OwyJDOZC230cwZKQ", "follower"},
    {"dut4DgrQoy1ldPUm", "follower"},
    {"TQ4Bps4wJIyVlS8L", "follower"},
    {"BrhJQCMrFiePXyjn", "follower"},
    {"jNJgfIkvz7v4sVpV", "follower"},
    {"zpkwsKWQEM6HNpZU", "follower"},
    {"jKwXJcq3GvUSRR9t", "follower"},
    {"ZmMSH2ci285cwEN1", "follower"},
    {"1ZgeDhYFKhUGNX0x", "follower"},
    {"spf96eeW3pnm9oWf", "follower"},
    {"nf5VjZYKmO9ZiXDb", "follower"},
    {"GBHsYfYVQ141akX0", "follower"},
    {"KfLn0mEH2zZt3zo5", "follower"},
    {"cciPyoVgAL8HT4s4", "follower"},
    {"9DUsmmVd7AzjFoba", "follower"},
    {"N8Y7CHCfJomoo6x8", "follower"},
    {"Gft0e5S0HERxywaW", "follower"},
    {"th4Vfu12Byj79qzB", "follower"},
    {"M1ck4l5Rpi08zOrW", "follower"},
    {"OQ5GBccWo1yqWV0a", "follower"},
    {"OQl7UzbIlnp742Cx", "follower"},
    {"HNttvt9uYG6DwP5U", "master"},
}   

local commands = {
    spam = {
        on = false,
    },

    follow = {
        on = false,
    },

    spamjump = {
        on = false,
    },

    spamActivate = {
        on = false,
    },

    spamHeadTP = {
        on = false,
    },
}

local prefix = "!"
local defaultGrav = game.Workspace.Gravity

--//Functions\\--
function isOwner(user)
    for _, v in pairs(accounts) do
        if v[1] == user then
            if v[2] == "master" then
                print(user, " is master")
                return true
            else
                print(user, " is follower")
                return false
            end
        end
    end

    print(user, " dont exist fool")
    return nil
end

function getAllAltsInServer()
    local list = {}

    for _, v in pairs(game.Players:GetChildren()) do
        for i, v2 in pairs(accounts) do
            if v.Name == v2[1] then
                table.insert(list, {v.Name, i})
            end
        end
    end

    return list
end

function getAltIndexInServer()
    local list = getAllAltsInServer()

    for i, v in pairs(list) do
        if plr.Name == v[1] then
            return i
        end
    end
end

function isntAuthor(plr, author)
    if plr.UserId == author.UserId then
        print(plr.Name.." | "..author.Name)
        print("false")
        return false
    else
        print(plr.Name.." | "..author.Name)
        print("true")
        return true
    end
end

function chat(msg)
    if game.PlaceId == 176053469 then
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "Server")
    else
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
    end
end

--split string
function split (inputstr, sep)
    if sep == nil then
      sep = "%s"
    end
  
    local t={}
  
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
      table.insert(t, str)
    end
  
    return t
end

--find player
function findPlayer(name)
    local closestPlrs = {}

    for _, v in pairs(game.Players:GetChildren()) do
        if v.Name:lower():find(name:lower()) or v.DisplayName:lower():find(name:lower()) then
            table.insert(closestPlrs, v.Name)
        end
    end

    if closestPlrs[1] then
        return closestPlrs[1]
    else
        return nil
    end
end

--is number
function isNumber(str)
    return not (str == "" or str:find("%D"))
end

--is in whitelist
function isRecognisedUser(name)
    for _, v in pairs(accounts) do
        if v[1] == name then
            return true
        end
    end

    return false
end

--all or specific
function checkRecipient(msg, whichArg)
    local aMsg = split(msg, " ")

    if aMsg[whichArg] then
        if aMsg[whichArg]:lower() == "all" then
            return "all"
        else
            if findPlayer(aMsg[whichArg]) then
                if isRecognisedUser(findPlayer(aMsg[whichArg])) then
                    return findPlayer(aMsg[whichArg])
                else
                    return "all"
                end
            end
        end
    else
        return "all"
    end
end

--command start
function commandStart(cmdName, msg, author)
    if msg:find(" ") then
        local args = split(msg)

        if args[1]:lower() == prefix..cmdName then
            if isOwner(author.name) then
                if isntAuthor(plr, author) then
                    return true
                else
                    return false
                end
            else
                return false
            end
        end
    end
end

--make http request
function getRequest(link)
    local hp = syn.request
    local main = hp(
        {
            Url = link,  
            Method = "GET"
        }
    )
  
    content = main.Body
    content = game.HttpService:JSONDecode(content)
  
    return content
end

-----------------------------------------------

--//Main\\--
----OPTIMIZATION
--Disable 3D Rendering
if not isOwner(plr.Name) then
    game:GetService("RunService"):Set3dRenderingEnabled(false)
end

----UI SETUP
local scrnGui = Instance.new("ScreenGui", plr.PlayerGui)
scrnGui.ResetOnSpawn = false
scrnGui.DisplayOrder = 50

local textLabel = Instance.new("TextLabel", scrnGui)
textLabel.TextScaled = true
textLabel.BackgroundColor3 = Color3.fromRGB(5, 5, 35)
textLabel.Font = Enum.Font.SourceSansLight
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextStrokeTransparency = 0
textLabel.Text = plr.Name.." (@"..plr.DisplayName..")"
textLabel.Size = UDim2.new(1, 0, 0.04, 0)
textLabel.Position = UDim2.new(0, 0, 0, 0)

--Startup
chat("Enabled | "..plr.Name.." (@"..plr.DisplayName..")")
spawn(function()
    wait(5)
    chat("FPS: "..tostring(math.floor(game.Workspace:GetRealPhysicsFPS())))
end)

 --[[
   ----COMMAND EXAMPLE----
    if commandStart("test", msg, author) then
        if checkRecipient(msg, 2) == "all" then
            chat("test")
        end

        if checkRecipient(msg, 2) ~= "all" then
            if plr.Name == checkRecipient(msg, 2) then
                chat("test")
            end
        end
    end
]]

--Optimizations
if not isOwner(plr.Name) then
    print("not master")
    UserSettings():GetService("UserGameSettings").MasterVolume = 0

    ----optimization
    --removing lights
    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v.ClassName:lower():find("light") then
            v:Destroy()
            print("found light, destroying | "..v.Name.." | "..v:GetFullName())
        end
    end

    --remove images
    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v.ClassName:lower():find("decal") then
            v:Destroy()
            print("found decal, destroying | "..v.Name.." | "..v:GetFullName())
        end

        if v.ClassName:lower():find("texture") then
            v:Destroy()
            print("found texture, destroying | "..v.Name.." | "..v:GetFullName())
        end

        if v.ClassName:lower():find("surfacegui") then
            v:Destroy()
            print("found surfacegui, destroying | "..v.Name.." | "..v:GetFullName())
        end
    end

    --set quality level
    UserSettings():GetService("UserGameSettings").SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1

    --disabling shadows
    game.Lighting.GlobalShadows = false
    game.Lighting.ShadowSoftness = 0

    --setting time to night
    game.Lighting.ClockTime = 0
end

--Commands
game.ReplicatedStorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(object)
    if not stopPerm then
        local msg = object.Message
        local author = game.Players:FindFirstChild(object.FromSpeaker)

        if isRecognisedUser(author.Name) then
            --disable
            if msg:lower() == prefix.."disable" then
                if isOwner(author.Name) then
                    chat("PlrC | Disabled")
                    stopPerm = true
                    scrnGui:Destroy()

                    local humRoot = plr.Character.HumanoidRootPart

                    for _, v in pairs(humRoot:GetChildren()) do
                        if v:IsA("BodyAngularVelocity") then
                            v:Destroy()
                        end
                    end
                end
            end

            --test
            if commandStart("test", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    chat("test")
                end
            
                if checkRecipient(msg, 2) ~= "all" then
                    if plr.Name == checkRecipient(msg, 2) then
                        chat("test")
                    end
                end
            end

            -----------

            --spam
            if commandStart("spam", msg, author) then
                local args = split(msg)

                if args[2] then
                    if isNumber(args[3]) then
                        if args[3] then
                            if checkRecipient(msg, 2) == "all" then
                                commands.spam.on = true

                                task.spawn(function()
                                    while task.wait(tonumber(args[3])) do
                                        if commands.spam.on == false or stopPerm then break end
                    
                                        chat(msg:gsub(args[1].." "..args[2].." "..args[3], ""))
                                    end
                                end)
                            end

                            if checkRecipient(msg, 2) ~= "all" then
                                if plr.Name == checkRecipient(msg, 2) then
                                    commands.spam.on = true

                                    task.spawn(function()
                                        while task.wait(tonumber(args[3])) do
                                            if commands.spam.on == false or stopPerm then break end
                        
                                            chat(msg:gsub(args[1].." "..args[2].." "..args[3], ""))
                                        end
                                    end)
                                end
                            end
                        end
                    end
                end
            end

            --unspam
            if commandStart("unspam", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    commands.spam.on = false
                end

                if checkRecipient(msg, 2) ~= "all" then
                    if plr.Name == checkRecipient(msg, 2) then
                        commands.spam.on = false
                    end
                end
            end

            -----------

            --say
            if commandStart("say", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    local args = split(msg)

                    table.remove(args, 1)
                    table.remove(args, 1)

                    if isntAuthor(plr, author) then
                        chat(table.concat(args, " "))
                    end
                end

                if checkRecipient(msg, 2) ~= "all" then
                    if plr.Name == checkRecipient(msg, 2) then
                        local args = split(msg)
                    
                        table.remove(args, 1)
                        table.remove(args, 1)

                        if isntAuthor(plr, author) then
                            chat(table.concat(args, " "))
                        end
                    end
                end
            end

            --say random quote         
            if commandStart("sayquote", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    if isntAuthor(plr, author) then
                        chat(getRequest("https://api.quotable.io/random").content)
                    end
                end

                if checkRecipient(msg, 2) ~= "all" then
                    if plr.Name == checkRecipient(msg, 2) then
                        if isntAuthor(plr, author) then
                            chat(getRequest("https://api.quotable.io/random").content)
                        end
                    end
                end
            end

            -----------

            --bring
            if commandStart("bring", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    if isntAuthor(plr, author) then
                        plr.Character.HumanoidRootPart.CFrame = author.Character.HumanoidRootPart.CFrame
                    end
                end
        
                if checkRecipient(msg, 2) ~= "all" then
                    if plr.Name == checkRecipient(msg, 2) then
                        if isntAuthor(plr, author) then
                            plr.Character.HumanoidRootPart.CFrame = author.Character.HumanoidRootPart.CFrame
                        end
                    end
                end
            end

            --line up
            if commandStart("line", msg, author) then
                print("line command")
                if isntAuthor(plr, author) then
                    print("isnt author")
                    local args = split(msg)
                    
                    if args[2] then
                        print("args 2")
                        local fList = getAllAltsInServer()
                        local list = {}
                        
                        for _, v in pairs(fList) do
                            print("creating list")
                            table.insert(list, v[1])
                        end

                        for i, v in pairs(list) do
                            print("creating list")
                            if v == plr.Name then
                                print("yes")
                                pcall(function()
                                    
                                    plr.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(list[i - 1][1]).Character.HumanoidRootPart.CFrame * (plr.Character.HumanoidRootPart.CFrame.LookVector * -1) * tonumber(args[2])
                                end)
                            end
                        end
                    end
                end        
            end

            --goto
            if commandStart("goto", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    local args = split(msg)

                    if args[3] then
                        if findPlayer(args[3]) then
                            plr.Character.HumanoidRootPart.CFrame = game.Workspace:FindFirstChild(findPlayer(args[3])).HumanoidRootPart.CFrame
                        end
                    end
                end
        
                if checkRecipient(msg, 2) ~= "all" then
                    if plr.Name == checkRecipient(msg, 2) then
                        local args = split(msg)

                        if args[3] then
                            if findPlayer(args[3]) then
                                plr.Character.HumanoidRootPart.CFrame = game.Workspace:FindFirstChild(findPlayer(args[3])).HumanoidRootPart.CFrame
                            end
                        end
                    end
                end
            end

            --loop headtp
            if commandStart("headtp", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    local args = split(msg)

                    if args[3] then
                        if args[4] then
                            if args[4]:lower() ~= "off" then
                                if findPlayer(args[3]) then
                                    commands.spamHeadTP.on = true
                                    local alignPart

                                    if not game.Workspace:FindFirstChild("AlignPart") then
                                        alignPart = Instance.new("Part", workspace)
                                        alignPart.CanCollide = false
                                        alignPart.Transparency = 1
                                        alignPart.Name = "AlignPart"
                                    else
                                        alignPart = game.Workspace:FindFirstChild("AlignPart")
                                    end

                                    local alignOrientation = Instance.new("AlignOrientation", plr.Character:WaitForChild("HumanoidRootPart"))
                                    alignOrientation.Name = "React"

                                    local a1 = Instance.new("Attachment", plr.Character.HumanoidRootPart)
                                    a1.Name = "Main1"
                                    local a2 = Instance.new("Attachment", game.Players:FindFirstChild(findPlayer(args[3])).Character.Head)
                                    a2.Name = "Main2"

                                    local hum = plr.Character:WaitForChild("Humanoid")
                                    hum.PlatformStand = true
    
                                    alignOrientation.Attachment0 = a1
                                    alignOrientation.Attachment1 = a2
                                    alignOrientation.RigidityEnabled = true

                                    game.Workspace.Gravity = 0

                                    spawn(function()
                                        local head = game.Players:FindFirstChild(findPlayer(args[3])).Character:WaitForChild("Head")

                                        while wait() do
                                            if commands.spamHeadTP.on == false then break end
                                            plr.Character:WaitForChild("HumanoidRootPart").CFrame = head.CFrame
                                        end
                                        return nil
                                    end)
                                end
                            elseif args[4]:lower() == "off" then
                                commands.spamHeadTP.on = false
                                game.Workspace.Gravity = defaultGrav

                                if plr.Character:WaitForChild("HumanoidRootPart"):FindFirstChild("React") then
                                    plr.Character:WaitForChild("HumanoidRootPart"):FindFirstChild("React"):Destroy()
                                end

                                if plr.Character:WaitForChild("HumanoidRootPart"):FindFirstChild("Main1") then
                                    plr.Character:WaitForChild("HumanoidRootPart"):FindFirstChild("Main1"):Destroy()
                                end

                                for i, v in pairs(game.Players:GetChildren()) do
                                    if v:IsA("Player") then
                                        if v.Character:WaitForChild("Head"):FindFirstChild("Main2") then
                                            v.Character:WaitForChild("Head"):FindFirstChild("Main2"):Destroy()
                                        end
                                    end
                                end

                                if game.Workspace:FindFirstChild("AlignPart") then
                                    game.Workspace:WaitForChild("AlignPart"):Destroy()
                                end

                                local hum = plr.Character:WaitForChild("Humanoid")
                                hum.PlatformStand = false
                            end
                        end
                    end
                end
        
                if checkRecipient(msg, 2) ~= "all" then
                    if plr.Name == checkRecipient(msg, 2) then
                        local args = split(msg)

                        if args[3] then
                            if args[4] then
                                if args[4]:lower() ~= "off" then
                                    if findPlayer(args[3]) then
                                        commands.spamHeadTP.on = true
                                        local alignPart
    
                                        if not game.Workspace:FindFirstChild("AlignPart") then
                                            alignPart = Instance.new("Part", workspace)
                                            alignPart.CanCollide = false
                                            alignPart.Transparency = 1
                                            alignPart.Name = "AlignPart"
                                        else
                                            alignPart = game.Workspace:FindFirstChild("AlignPart")
                                        end
    
                                        local alignOrientation = Instance.new("AlignOrientation", plr.Character:WaitForChild("HumanoidRootPart"))
                                        alignOrientation.Name = "React"
    
                                        local a1 = Instance.new("Attachment", plr.Character.HumanoidRootPart)
                                        a1.Name = "Main1"
                                        local a2 = Instance.new("Attachment", game.Players:FindFirstChild(findPlayer(args[3])).Character.Head)
                                        a2.Name = "Main2"
    
                                        local hum = plr.Character:WaitForChild("Humanoid")
                                        hum.PlatformStand = true
        
                                        alignOrientation.Attachment0 = a1
                                        alignOrientation.Attachment1 = a2
                                        alignOrientation.RigidityEnabled = true

                                        game.Workspace.Gravity = 0             
    
                                        spawn(function()
                                            local head = game.Players:FindFirstChild(findPlayer(args[3])).Character:WaitForChild("Head")
    
                                            while wait() do
                                                if commands.spamHeadTP.on == false then break end
                                                plr.Character:WaitForChild("HumanoidRootPart").CFrame = head.CFrame
                                            end
                                            return nil
                                        end)
                                    end
                                elseif args[4]:lower() == "off" then
                                    commands.spamHeadTP.on = false
                                    game.Workspace.Gravity = defaultGrav
    
                                    if plr.Character:WaitForChild("HumanoidRootPart"):FindFirstChild("React") then
                                        plr.Character:WaitForChild("HumanoidRootPart"):FindFirstChild("React"):Destroy()
                                    end
    
                                    if plr.Character:WaitForChild("HumanoidRootPart"):FindFirstChild("Main1") then
                                        plr.Character:WaitForChild("HumanoidRootPart"):FindFirstChild("Main1"):Destroy()
                                    end
    
                                    for i, v in pairs(game.Players:GetChildren()) do
                                        if v:IsA("Player") then
                                            if v.Character:WaitForChild("Head"):FindFirstChild("Main2") then
                                                v.Character:WaitForChild("Head"):FindFirstChild("Main2"):Destroy()
                                            end
                                        end
                                    end
    
                                    if game.Workspace:FindFirstChild("AlignPart") then
                                        game.Workspace:WaitForChild("AlignPart"):Destroy()
                                    end
    
                                    local hum = plr.Character:WaitForChild("Humanoid")
                                    hum.PlatformStand = false
                                end
                            end
                        end
                    end
                end
            end

            -----------

            --sit
            if commandStart("sit", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    if isntAuthor(plr, author) then
                        plr.Character.Humanoid.Sit = true
                    end
                end

                if checkRecipient(msg, 2) ~= "all" then
                    local args = split(msg)

                    if findPlayer(args[2]) then
                        if findPlayer(args[2]) == plr.Name then
                            plr.Character.Humanoid.Sit = true
                        end
                    end
                end
            end

            -----------

            --jump
            if commandStart("jump", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    if isntAuthor(plr, author) then
                        plr.Character.Humanoid.Jump = true
                    end
                end

                if checkRecipient(msg, 2) ~= "all" then
                    local args = split(msg)

                    if findPlayer(args[2]) then
                        if findPlayer(args[2]) == plr.Name then
                            plr.Character.Humanoid.Jump = true
                        end
                    end
                end
            end

            --spam jump
            if commandStart("sjump", msg, author) or commandStart("spamjump", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    if isntAuthor(plr, author) then
                        local args = split(msg)

                        if args[3] == "off" then
                            commands.spamjump.on = false
                        end

                        if args[3] ~= "off" then
                            commands.spamjump.on = true

                            task.spawn(function()
                                while true do
                                    task.wait(0.01)
                                    if commands.spamjump.on == false or stopPerm then break end

                                    task.wait(tonumber(tonumber(args[3])))
                                    plr.Character.Humanoid.Jump = true
                                end
                            end)
                        end
                    end
                end

                if checkRecipient(msg, 2) ~= "all" then
                    local args = split(msg)

                    if findPlayer(args[2]) then
                        if findPlayer(args[2]) == plr.Name then
                            local args = split(msg)

                            if args[3] == "off" then
                                commands.spamjump.on = false
                            end

                            if args[3] ~= "off" then
                                commands.spamjump.on = true
    
                                task.spawn(function()
                                    while true do
                                        task.wait(0.01)
                                        if commands.spamjump.on == false or stopPerm then break end
    
                                        task.wait(tonumber(tonumber(args[3])))
                                        plr.Character.Humanoid.Jump = true
                                    end
                                end)
                            end
                        end
                    end
                end
            end

            -----------

            --follow
            if commandStart("follow", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    if isntAuthor(plr, author) then
                        local args = split(msg)

                        if args[3] then
                            if args[3]:lower() == "no" then
                                commands.follow.on = true

                                task.spawn(function()
                                    while task.wait() do
                                        if commands.follow.on == false or stopPerm then break end                        
                                        plr.Character.Humanoid:MoveTo(game.Workspace:FindFirstChild(author.Name).HumanoidRootPart.Position)
                                    end
                                end)
                            else
                                if findPlayer(args[3])  then
                                    commands.follow.on = true

                                    task.spawn(function()
                                        while task.wait() do
                                            if commands.follow.on == false or stopPerm then break end
                                            if game.Players:FindFirstChild(findPlayer(args[3])) then
                                                plr.Character.Humanoid:MoveTo(game.Workspace:FindFirstChild(findPlayer(args[3])).HumanoidRootPart.Position)
                                            else
                                                commands.follow.on = false
                                            end
                                        end
                                    end)
                                end
                            end
                        end
                    end
                end

                if checkRecipient(msg, 2) ~= "all" then
                    local args = split(msg)

                    if findPlayer(args[2]) then
                        if findPlayer(args[2]) == plr.Name then
                            if isntAuthor(plr, author) then
                                if args[3] then
                                    if args[3]:lower() == "no" then
                                        commands.follow.on = true

                                        task.spawn(function()
                                            while task.wait() do
                                                if commands.follow.on == false or stopPerm then break end   

                                                if game.Players:FindFirstChild(findPlayer(author.Name)) then
                                                    plr.Character.Humanoid:MoveTo(game.Workspace:FindFirstChild(author.Name).HumanoidRootPart.Position)
                                                else
                                                    commands.follow.on = false
                                                end
                                            end
                                        end)
                                    else
                                        if findPlayer(args[3])  then
                                            commands.follow.on = true

                                            task.spawn(function()
                                                while task.wait() do
                                                    if commands.follow.on == false or stopPerm then break end
                               
                                                    if game.Players:FindFirstChild(findPlayer(args[3])) then
                                                        plr.Character.Humanoid:MoveTo(game.Workspace:FindFirstChild(findPlayer(args[3])).HumanoidRootPart.Position)
                                                    else
                                                        commands.follow.on = false
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
            end

            --unfollow
            if commandStart("unfollow", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    if isntAuthor(plr, author) then
                        commands.follow.on = false
                        plr.Character.Humanoid:MoveTo(plr.Character.HumanoidRootPart.Position)
                    end
                end

                if checkRecipient(msg, 2) ~= "all" then
                    local args = split(msg)

                    if findPlayer(args[2]) then
                        if findPlayer(args[2]) == plr.Name then
                            commands.follow.on = false
                            plr.Character.Humanoid:MoveTo(plr.Character.HumanoidRootPart.Position)
                        end
                    end
                end
            end


            --walk
            if commandStart("walk", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    if isntAuthor(plr, author) then
                        local args = split(msg)

                        if args[3] then
                            if args[3]:lower() == "front" then
                                if args[4] then
                                    if args[5] then
                                        if args[5] == "z" then
                                            if isntAuthor(plr, author) then
                                                local hum = plr.Character.Humanoid
                                                hum:MoveTo(hum.parent.HumanoidRootPart.Position + Vector3.new(0, 0, args[4]))
                                            end
                                        end

                                        if args[5] == "x" then
                                            if isntAuthor(plr, author) then
                                                local hum = plr.Character.Humanoid
                                                hum:MoveTo(hum.parent.HumanoidRootPart.Position + Vector3.new(args[4], 0, 0))
                                            end
                                        end
                                    end
                                end
                            end

                            if args[3]:lower() == "back" then
                                if args[4] then
                                    if args[5] then
                                        if args[5] == "z" then
                                            if isntAuthor(plr, author) then
                                                local hum = plr.Character.Humanoid
                                                hum:MoveTo(hum.parent.HumanoidRootPart.Position - Vector3.new(0, 0, args[4]))
                                            end
                                        end

                                        if args[5] == "x" then
                                            if isntAuthor(plr, author) then
                                                local hum = plr.Character.Humanoid
                                                hum:MoveTo(hum.parent.HumanoidRootPart.Position - Vector3.new(args[4], 0, 0))
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end

                if checkRecipient(msg, 2) ~= "all" then
                    local args = split(msg)

                    if findPlayer(args[2]) then
                        if findPlayer(args[2]) == plr.Name then
                            if args[3] then
                                if args[3]:lower() == "front" then
                                    if args[4] then
                                        if args[5] then
                                            if args[5] == "z" then
                                                if isntAuthor(plr, author) then
                                                    local hum = plr.Character.Humanoid
                                                    hum:MoveTo(hum.parent.HumanoidRootPart.Position + Vector3.new(0, 0, args[4]))
                                                end
                                            end
    
                                            if args[5] == "x" then
                                                if isntAuthor(plr, author) then
                                                    local hum = plr.Character.Humanoid
                                                    hum:MoveTo(hum.parent.HumanoidRootPart.Position + Vector3.new(args[4], 0, 0))
                                                end
                                            end
                                        end
                                    end
                                end
    
                                if args[3]:lower() == "back" then
                                    if args[4] then
                                        if args[5] then
                                            if args[5] == "z" then
                                                if isntAuthor(plr, author) then
                                                    local hum = plr.Character.Humanoid
                                                    hum:MoveTo(hum.parent.HumanoidRootPart.Position - Vector3.new(0, 0, args[4]))
                                                end
                                            end
    
                                            if args[5] == "x" then
                                                if isntAuthor(plr, author) then
                                                    local hum = plr.Character.Humanoid
                                                    hum:MoveTo(hum.parent.HumanoidRootPart.Position - Vector3.new(args[4], 0, 0))
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end

            -----------

            --walkspeed
            if commandStart("ws", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    if isntAuthor(plr, author) then
                        local args = split(msg)

                        if args[3] then
                            if args[3] == "normal" then
                                plr.Character.Humanoid.WalkSpeed = 16
                            else
                                plr.Character.Humanoid.WalkSpeed = tonumber(args[3])
                            end
                        end
                    end
                end

                if checkRecipient(msg, 2) ~= "all" then
                    local args = split(msg)

                    if findPlayer(args[2]) then
                        if findPlayer(args[2]) == plr.Name then
                            if isntAuthor(plr, author) then
                                if args[3] then
                                    if args[3] == "normal" then
                                        plr.Character.Humanoid.WalkSpeed = 16
                                    else
                                        plr.Character.Humanoid.WalkSpeed = tonumber(args[3])
                                    end
                                end
                            end
                        end
                    end
                end
            end

            -----------

            --kill
            if commandStart("kill", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    if isntAuthor(plr, author) then
                        plr.Character.Humanoid.Health = 0
                    end
                end

                if checkRecipient(msg, 2) ~= "all" then
                    local args = split(msg)

                    if findPlayer(args[2]) then
                        if findPlayer(args[2]) == plr.Name then
                            if isntAuthor(plr, author) then
                                plr.Character.Humanoid.Health = 0
                            end
                        end
                    end
                end
            end

            -----------

            --spin
            if commandStart("spin", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    local args = split(msg)

                    if isntAuthor(plr, author) then
                        if args[3] then
                            local humRoot = plr.Character.HumanoidRootPart
                            
                            if not humRoot:FindFirstChild("BodyAngularVelocity") then
                                local bodyAngularVelocity = Instance.new("BodyAngularVelocity", humRoot)
                                bodyAngularVelocity.MaxTorque = Vector3.new(0, 12515151512, 0)
                                bodyAngularVelocity.P = 25252252
                                bodyAngularVelocity.AngularVelocity = Vector3.new(0, tonumber(args[3]), 0)
                            end
                        else
                            local humRoot = plr.Character.HumanoidRootPart
                            
                            if not humRoot:FindFirstChild("BodyAngularVelocity") then
                                local bodyAngularVelocity = Instance.new("BodyAngularVelocity", humRoot)
                                bodyAngularVelocity.MaxTorque = Vector3.new(0, 12515151512, 0)
                                bodyAngularVelocity.P = 25252252
                                bodyAngularVelocity.AngularVelocity = Vector3.new(0, 5, 0)
                            end
                        end
                    end
                end

                if checkRecipient(msg, 2) ~= "all" then
                    local args = split(msg)

                    if findPlayer(args[2]) then
                        if findPlayer(args[2]) == plr.Name then
                            if isntAuthor(plr, author) then
                                if args[3] then
                                    local humRoot = plr.Character.HumanoidRootPart
                                    
                                    if not humRoot:FindFirstChild("BodyAngularVelocity") then
                                        local bodyAngularVelocity = Instance.new("BodyAngularVelocity", humRoot)
                                        bodyAngularVelocity.MaxTorque = Vector3.new(0, 12515151512, 0)
                                        bodyAngularVelocity.P = 25252252
                                        bodyAngularVelocity.AngularVelocity = Vector3.new(0, tonumber(args[3]), 0)
                                    end
                                else
                                    local humRoot = plr.Character.HumanoidRootPart
                                    
                                    if not humRoot:FindFirstChild("BodyAngularVelocity") then
                                        local bodyAngularVelocity = Instance.new("BodyAngularVelocity", humRoot)
                                        bodyAngularVelocity.MaxTorque = Vector3.new(0, 12515151512, 0)
                                        bodyAngularVelocity.P = 25252252
                                        bodyAngularVelocity.AngularVelocity = Vector3.new(0, 5, 0)
                                    end
                                end
                            end
                        end
                    end
                end
            end

            --unspin
            if commandStart("nospin", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    if isntAuthor(plr, author) then
                        local humRoot = plr.Character.HumanoidRootPart

                        for _, v in pairs(humRoot:GetChildren()) do
                            if v:IsA("BodyAngularVelocity") then
                                v:Destroy()
                            end
                        end
                    end
                end

                if checkRecipient(msg, 2) ~= "all" then
                    local args = split(msg)

                    if findPlayer(args[2]) then
                        if findPlayer(args[2]) == plr.Name then
                            if isntAuthor(plr, author) then
                                local humRoot = plr.Character.HumanoidRootPart

                                for _, v in pairs(humRoot:GetChildren()) do
                                    if v:IsA("BodyAngularVelocity") then
                                        v:Destroy()
                                    end
                                end
                            end
                        end
                    end
                end
            end

            -----------

            --dance
            if commandStart("dance", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    if isntAuthor(plr, author) then
                        local num = math.random(0, 3)

                        if num == 0 then
                            plr.Parent:Chat("/e dance")
                        else
                            plr.Parent:Chat("/e dance"..tostring(num))
                        end
                    end
                end

                if checkRecipient(msg, 2) ~= "all" then
                    local args = split(msg)

                    if findPlayer(args[2]) then
                        if findPlayer(args[2]) == plr.Name then
                            if isntAuthor(plr, author) then
                                local num = math.random(0, 3)

                                if num == 0 then
                                    plr.Parent:Chat("/e dance")
                                else
                                    plr.Parent:Chat("/e dance"..tostring(num))
                                end
                            end
                        end
                    end
                end
            end

            --wave
            if commandStart("wave", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    if isntAuthor(plr, author) then
                        plr.Parent:Chat("/e wave")
                    end
                end

                if checkRecipient(msg, 2) ~= "all" then
                    local args = split(msg)

                    if findPlayer(args[2]) then
                        if findPlayer(args[2]) == plr.Name then
                            if isntAuthor(plr, author) then
                                plr.Parent:Chat("/e wave")
                            end
                        end
                    end
                end
            end

            --cheer
            if commandStart("cheer", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    if isntAuthor(plr, author) then
                        plr.Parent:Chat("/e cheer")
                    end
                end

                if checkRecipient(msg, 2) ~= "all" then
                    local args = split(msg)

                    if findPlayer(args[2]) then
                        if findPlayer(args[2]) == plr.Name then
                            if isntAuthor(plr, author) then
                                plr.Parent:Chat("/e cheer")
                            end
                        end
                    end
                end
            end


            --laugh
            if commandStart("laugh", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    if isntAuthor(plr, author) then
                        plr.Parent:Chat("/e laugh")
                    end
                end

                if checkRecipient(msg, 2) ~= "all" then
                    local args = split(msg)

                    if findPlayer(args[2]) then
                        if findPlayer(args[2]) == plr.Name then
                            if isntAuthor(plr, author) then
                                plr.Parent:Chat("/e laugh")
                            end
                        end
                    end
                end
            end
            -----------

            --equip tool
            if commandStart("equip", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    if isntAuthor(plr, author) then
                        local args = split(msg)

                        if args[3] then
                            local count = 0
                            
                            for _, v in pairs(plr.Backpack:GetChildren()) do
                                print("for loop")
                                count = count + 1

                                if count == tonumber(args[3]) then
                                    v.Parent = plr.Character
                                end
                            end
                        end
                    end
                end

                if checkRecipient(msg, 2) ~= "all" then
                    local args = split(msg)

                    if findPlayer(args[2]) then
                        if findPlayer(args[2]) == plr.Name then
                            if isntAuthor(plr, author) then
                                if args[3] then
                                    local count = 0
                            
                                    for _, v in pairs(plr.Backpack:GetChildren()) do
                                        print("for loop")
                                        count = count + 1

                                        if count == tonumber(args[3]) then
                                            v.Parent = plr.Character
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end

            --unequip tool
            if commandStart("unequip", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    if isntAuthor(plr, author) then
                        for _, v in pairs(plr.Character:GetChildren()) do
                            if v:IsA("Tool") then
                                v.Parent = plr.Backpack
                            end
                        end
                    end
                end

                if checkRecipient(msg, 2) ~= "all" then
                    local args = split(msg)

                    if findPlayer(args[2]) then
                        if findPlayer(args[2]) == plr.Name then
                            if isntAuthor(plr, author) then
                                for _, v in pairs(plr.Character:GetChildren()) do
                                    if v:IsA("Tool") then
                                        v.Parent = plr.Backpack
                                    end
                                end
                            end
                        end
                    end
                end
            end

            --activate tool
            if commandStart("activate", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    if isntAuthor(plr, author) then
                        local char = plr.Character

                        for _, v in pairs(char:GetChildren()) do
                            if v:IsA("Tool") then
                                v:Activate()
                                mousemoverel(0.5, 0.5)
                                wait()
                                mouse1click()
                            end
                        end
                    end
                end

                if checkRecipient(msg, 2) ~= "all" then
                    local args = split(msg)

                    if findPlayer(args[2]) then
                        if findPlayer(args[2]) == plr.Name then
                            if isntAuthor(plr, author) then
                                local char = plr.Character

                                for _, v in pairs(char:GetChildren()) do
                                    if v:IsA("Tool") then        
                                        v:Activate()     
                                        mousemoverel(0.5, 0.5)
                                        wait()
                                        mouse1click()
                                    end
                                end
                            end
                        end
                    end
                end
            end

            --spam activate
            if commandStart("sactivate", msg, author) or commandStart("spamactivate", msg, author) then
                if checkRecipient(msg, 2) == "all" then
                    if isntAuthor(plr, author) then
                        local args = split(msg)
                        local char = plr.Character

                        if args[3] and args[3] == "off" then
                            commands.spamActivate.on = false
                        else
                            commands.spamActivate.on = true
                            spawn(function()
                                while true do
                                   if not commands.spamActivate.on or stopPerm then break end
                                   print("s activate loop")
                                   for _, v in pairs(char:GetChildren()) do
                                        if v:IsA("Tool") then
                                            v:Activate()
                                            mousemoverel(0.5, 0.5)
                                            wait()
                                            mouse1click()
                                        end
                                    end
                                    wait(tonumber(args[3]))
                                end
                            end)
                        end

                        if not args[3] then
                            commands.spamActivate.on = true
                            spawn(function()
                                while true do
                                   if not commands.spamActivate.on or stopPerm then break end
                                   for _, v in pairs(char:GetChildren()) do
                                        if v:IsA("Tool") then
                                            v:Activate()
                                            mousemoverel(0.5, 0.5)
                                            wait()
                                            mouse1click()
                                        end
                                    end
                                    wait(tonumber(args[3]))
                                end
                            end)
                        end
                    end
                end

                if checkRecipient(msg, 2) ~= "all" then
                    local args = split(msg)

                    if findPlayer(args[2]) then
                        if findPlayer(args[2]) == plr.Name then
                            if isntAuthor(plr, author) then
                                local char = plr.Character

                                if args[3] and args[3] == "off" then
                                    commands.spamActivate.on = false
                                else
                                    commands.spamActivate.on = true
                                    spawn(function()
                                        while true do
                                            if not commands.spamActivate.on then break end
                                            for _, v in pairs(char:GetChildren()) do
                                                if v:IsA("Tool") then
                                                    v:Activate()
                                                    mousemoverel(0.5, 0.5)
                                                    wait()
                                                    mouse1click()
                                                end
                                            end
                                            wait(tonumber(args[3]))
                                        end
                                    end)
                                end

                                if not args[3] then
                                    commands.spamActivate.on = true
                                    spawn(function()
                                        while true do
                                            if not commands.spamActivate.on then break end
                                            for _, v in pairs(char:GetChildren()) do
                                                if v:IsA("Tool") then
                                                    v:Activate()
                                                    mousemoverel(0.5, 0.5)
                                                    wait()
                                                    mouse1click()
                                                end
                                            end
                                            wait(tonumber(args[3]))
                                        end
                                    end)
                                end
                            end
                        end
                    end
                end
            end
            -----------

            --add/remove master
            if msg:find(" ") then
                local args = split(msg)

                if args[1]:lower() == prefix.."master" then
                    if isOwner(author.Name) then
                        if args[2] then
                            if args[3] then
                                if args[3]:lower() == "add" then
                                    local chosenPlr = findPlayer(args[2])

                                    if chosenPlr ~= nil then
                                        table.insert(accounts, {chosenPlr, "master"})
                                        chat("Added "..chosenPlr.." to whitelist.")
                                    end
                                end

                                if args[3]:lower() == "remove" then
                                    if findPlayer(args[2], author) then
                                        local chosenPlr = findPlayer(args[2])

                                        for i, v in pairs(accounts) do
                                            if v[1] == chosenPlr then
                                                table.remove(accounts, i)
                                                chat("Removed "..v[1].." from whitelist.")
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

-----------------------------------------------
--anti afk
local virtualUser = game:GetService("VirtualUser")

plr.Idled:Connect(function()
    virtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    virtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

--[[
--commands loop
while true do
    wait()
    if stopPerm then
        break
    else
        --spam
        if commands.spam.on == true then
            task.spawn(function()
                while task.wait(tonumber(commands.spam.amount)) do
                    if commands.spam.on == false then break end

                    chat(commands.spam.content)
                end
            end)
        end

        --follow
        if commands.follow.on == true then
            task.spawn(function()
                while task.wait() do
                    if commands.follow.on == false then break end

                    if game.Players:FindFirstChild(commands.follow.content) then
                        plr.Character.Humanoid:MoveTo(game.Workspace:FindFirstChild(commands.follow.content).HumanoidRootPart.Position)
                    else
                        commands.follow.on = false
                        commands.follow.content = ""
                    end
                end
            end)
        end

        --spam jump
        if commands.spamjump.on == true then
            task.spawn(function()
                while task.wait(tonumber(commands.spamjump.content)) do
                    if commands.spamjump.on == false then break end

                    plr.Character.Humanoid.Jump = true
                    task.wait(0.01)
                    plr.Character.Humanoid.Jump = false
                end
            end)
        end
    end
end
]]
