--//Variables\\--
local stopPerm = false
local plr = game.Players.LocalPlayer

local accounts = {
    {"roooooo_4", "master"},
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
    {"HNttvt9uYG6DwP5U", "follower"},
}   

local commands = {
    spam = {
        on = false,
        content = "",
        amount = 0,
    },

    say = {
        on = false,
        content = "",
    },

    abring = {
        on = false,
        content = "",
    },

    bring = {
        on = false,
        content = "",
    },

    goto = {
        on = false,
        content = "",
    },

    follow = {
        on = false,
        content = "",
    },

    sit = {
        on = false,
        content = "",
    },

    jump = {
        on = false,
        content = "",
    },

    spamjump = {
        on = false,
        content = "",
    },

    kill = {
        on = false,
        content = "",
    },

    ws = {
        on = false,
        content = "",
    },

    dance = {
        on = false,
        content = "",
    },

    wave = {
        on = false,
        content = "",
    },

    cheer = {
        on = false,
        content = "",
    },

    laugh = {
        on = false,
        content = "",
    },
}

local prefix = "!"

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
    if game.PlaceId == "176053469" then
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
function findPlayer(name, author)
    local closestPlrs = {}

    for _, v in pairs(game.Players:GetChildren()) do
        if v.Name:lower():find(name:lower()) or v.DisplayName:lower():find(name:lower()) then
            table.insert(closestPlrs, v.Name)
        end
    end

    if closestPlrs[1] then
        return closestPlrs[1]
    else
        return author.Name
    end
end

--is number
local function isNumber(str)
    return not (str == "" or str:find("%D"))
end

local function isRecognisedUser(name)
    for _, v in pairs(accounts) do
        if v[1] == name then
            return true
        end
    end

    return false
end

-----------------------------------------------

--//Main\\--
----OPTIMIZATION
--Disable 3D Rendering
if not isOwner(plr.name) then
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

--COMMANDS
chat("Enabled | "..plr.Name.." (@"..plr.DisplayName..")")

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
                end
            end

            -----------

            --spam
            if msg:lower():find(" ") then
                local args = split(msg)

                if args[1]:lower() == prefix.."spam" then
                    if isOwner(author.Name) then
                        if isntAuthor(plr, author) then
                            if isNumber(args[2]) then
                                commands.spam.on = true
                                commands.spam.content = msg:gsub(args[1].." "..args[2], "")
                                commands.spam.amount = tonumber(args[2])

                                task.spawn(function()
                                    while task.wait(tonumber(commands.spam.amount)) do
                                        if commands.spam.on == false then break end
                    
                                        chat(commands.spam.content)
                                    end
                                end)
                            else
                                commands.spam.on = true
                                commands.spam.content = msg:gsub(args[1].." "..args[2], "")
                                commands.spam.amount = 1

                                task.spawn(function()
                                    while task.wait(tonumber(commands.spam.amount)) do
                                        if commands.spam.on == false or stopPerm == true then break end
                    
                                        chat(commands.spam.content)
                                    end
                                end)
                            end
                        end
                    end
                end
            end

            --unspam
            if msg:lower() == prefix.."unspam" then
                if isOwner(author.Name) then
                    commands.spam.on = false
                    commands.spam.content = ""
                    commands.spam.amount = 0
                end
            end

            -----------

            --say
            if msg:lower():find(" ") then
                local args = split(msg)

                if args[1]:lower() == prefix.."say" then
                    if isOwner(author.Name) then
                        commands.say.on = true
                        table.remove(args, 1)
                        commands.say.content = table.concat(args, " ")

                        if isntAuthor(plr, author) then
                            chat(commands.say.content)
                            commands.say.on = false
                            commands.say.content = ""
                        end
                    end
                end
            end

            -----------

            --bring certain alt
            if msg:find(" ") then
                local args = split(msg)

                if args[1]:lower() == prefix.."abring" then
                    if isOwner(author.Name) then
                        if args[2] then
                            local chosenPlr = findPlayer(args[2], author)
                            
                            if chosenPlr then
                                if chosenPlr == plr.Name then                           
                                    commands.abring.on = true
                                    plr.Character.HumanoidRootPart.CFrame = author.Character.HumanoidRootPart.CFrame
                                    commands.abring.on = false
                                end
                            end
                        end
                    end
                end
            end

            --bring
            if msg:lower() == prefix.."bring" then
                if isOwner(author.Name) then
                    print("bringing")

                    commands.bring.on = true
                    plr.Character.HumanoidRootPart.CFrame = author.Character.HumanoidRootPart.CFrame
                    commands.bring.on = false
                end
            end

            --goto
            if msg:find(" ") then
                local args = split(msg)

                if args[1]:lower() == prefix.."goto" then
                    if isOwner(author.Name) then
                        if isntAuthor(plr, author) then
                            if args[2] then
                                if findPlayer(args[2], author) then
                                    commands.goto.on = true
                                    plr.Character.HumanoidRootPart.CFrame = game.Workspace:FindFirstChild(findPlayer(args[2], author)).HumanoidRootPart.CFrame
                                    commands.goto.on = false
                                end
                            end
                        end
                    end
                end
            end

            -----------

            --sit
            if msg:lower() == prefix.."sit" then
                if isOwner(author.Name) then
                    if isntAuthor(plr, author) then
                        print("sitting")

                        plr.Character.Humanoid.Sit = true
                    end
                end
            end

            -----------

            --jump
            if msg:lower() == prefix.."jump" then
                if isOwner(author.Name) then
                    if isntAuthor(plr, author) then
                        print("jumping")

                        plr.Character.Humanoid.Jump = true
                    end
                end
            end

            --spam jump
            if msg:find(" ") then
                local args = split(msg)

                if args[1]:lower() == prefix.."sjump" or args[1]:lower() == prefix.."spamjump" then
                    if isOwner(author.Name) then
                        if args[2] then
                            if args[2] == "off" then
                                commands.spamjump.on = false
                                commands.spamjump.content = ""

                            end

                            if args[2] ~= "off" then
                                commands.spamjump.on = true
                                commands.spamjump.content = tonumber(args[2])

                                task.spawn(function()
                                    while true do
                                        task.wait(0.01)
                                        if commands.spamjump.on == false or stopPerm == true then break end

                                        if isntAuthor(plr, author) then
                                            task.wait(tonumber(commands.spamjump.content))
                                            plr.Character.Humanoid.Jump = true
                                            chat("test")
                                        end
                                    end
                                end)
                            end
                        end
                    end
                end
            end

            -----------

            --follow
            if msg:find(" ") then
                local args = split(msg)

                if args[1]:lower() == prefix.."follow" then
                    if isOwner(author.Name) then
                        if isntAuthor(plr, author) then
                            if args[2] then
                                if args[2]:lower() == "no" then
                                    print("following 2 ARGS")

                                    commands.follow.on = true
                                    commands.follow.content = author.Name
                                    print(args[2])

                                    task.spawn(function()
                                        while task.wait() do
                                            if commands.follow.on == false or stopPerm == true then break end
                        
                                            if game.Players:FindFirstChild(commands.follow.content) then
                                                plr.Character.Humanoid:MoveTo(game.Workspace:FindFirstChild(commands.follow.content).HumanoidRootPart.Position)
                                            else
                                                commands.follow.on = false
                                                commands.follow.content = ""
                                            end
                                        end
                                    end)
                                else
                                    if findPlayer(args[2], author)  then
                                        print("following 2 ARGS")

                                        commands.follow.on = true
                                        commands.follow.content = findPlayer(args[2], author)
                                        print(findPlayer(args[2], author))

                                        task.spawn(function()
                                            while task.wait() do
                                                if commands.follow.on == false or stopPerm == true then break end
                            
                                                if game.Players:FindFirstChild(commands.follow.content) then
                                                    plr.Character.Humanoid:MoveTo(game.Workspace:FindFirstChild(commands.follow.content).HumanoidRootPart.Position)
                                                else
                                                    commands.follow.on = false
                                                    commands.follow.content = ""
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

            --unfollow
            if msg:lower() == prefix.."unfollow" then
                if isOwner(author.Name) then
                    print("unfollowing")

                    commands.follow.on = false
                    commands.follow.content = ""

                    if isntAuthor(plr, author) then
                        plr.Character.Humanoid:MoveTo(plr.Character.HumanoidRootPart.Position)
                    end
                end
            end

            --walk
            if msg:find(" ") then
                local args = split(msg)

                if args[1]:lower() == prefix.."walk" then
                    if isOwner(author.Name) then
                        if args[2] then
                            if args[2]:lower() == "front" then
                                if args[3] then
                                    if args[4] then
                                        if args[4] == "z" then
                                            if isntAuthor(plr, author) then
                                                local hum = plr.Character.Humanoid
                                                hum:MoveTo(hum.parent.HumanoidRootPart.Position + Vector3.new(0, 0, args[3]))
                                            end
                                        end

                                        if args[4] == "x" then
                                            if isntAuthor(plr, author) then
                                                local hum = plr.Character.Humanoid
                                                hum:MoveTo(hum.parent.HumanoidRootPart.Position + Vector3.new(args[3], 0, 0))
                                            end
                                        end
                                    end
                                end
                            end

                            if args[2]:lower() == "back" then
                                if args[3] then
                                    if args[4] then
                                        if args[4] == "z" then
                                            if isntAuthor(plr, author) then
                                                local hum = plr.Character.Humanoid
                                                hum:MoveTo(hum.parent.HumanoidRootPart.Position - Vector3.new(0, 0, args[3]))
                                            end
                                        end

                                        if args[4] == "x" then
                                            if isntAuthor(plr, author) then
                                                local hum = plr.Character.Humanoid
                                                hum:MoveTo(hum.parent.HumanoidRootPart.Position - Vector3.new(args[3], 0, 0))
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
            if msg:lower():find(" ") then
                local args = split(msg)

                if args[1]:lower() == prefix.."ws" then
                    if isOwner(author.Name) then
                        if args[2] then
                            if args[2] == "normal" then
                                commands.ws.content = "16"
                                commands.ws.on = true
                                plr.Character.Humanoid.WalkSpeed = 16
                                commands.ws.on = false
                            else
                                commands.ws.content = args[2]
                                commands.ws.on = true
                                plr.Character.Humanoid.WalkSpeed = tonumber(args[2])
                                commands.ws.on = false
                            end
                        end
                    end
                end
            end

            -----------

            --toggle ragdoll
            if msg:lower() == prefix.."tragdoll" then
                if isOwner(author.Name) then
                    if isntAuthor(plr, author) then
                        keypress(70)
                        keyrelease(70)
                    end
                end
            end

            -----------

            --kill
            if msg:lower() == prefix.."kill" then
                if isOwner(author.Name) then
                    if isntAuthor(plr, author) then
                        commands.kill.on = true
                        plr.Character.Humanoid.Health = 0
                        commands.kill.on = false
                    end
                end
            end

            -----------

            --dance
            if msg:lower() == prefix.."dance" then
                if isOwner(author.Name) then
                    commands.dance.on = true
                    local num = math.random(0, 3)

                    if num == 0 then
                        plr.Parent:Chat("/e dance")
                    else
                        plr.Parent:Chat("/e dance"..tostring(num))
                    end

                    commands.dance.on = false
                end
            end

            --wave
            if msg:lower() == prefix.."wave" then
                if isOwner(author.Name) then
                    commands.wave.on = true
                    plr.Parent:Chat("/e wave")
                    commands.wave.on = false
                end
            end

            --cheer
            if msg:lower() == prefix.."cheer" then
                if isOwner(author.Name) then
                    commands.cheer.on = true
                    plr.Parent:Chat("/e cheer")
                    commands.cheer.on = false
                end
            end

            --laugh
            if msg:lower() == prefix.."laugh" then
                if isOwner(author.Name) then
                    commands.laugh.on = true
                    plr.Parent:Chat("/e laugh")
                    commands.laugh.on = false
                end
            end 

            -----------

            --follow
            if msg:find(" ") then
                local args = split(msg)

                if args[1]:lower() == prefix.."master" then
                    if isOwner(author.Name) then
                        if args[2] then
                            if args[3] then
                                if args[3]:lower() == "add" then
                                    if findPlayer(args[2], author) then
                                        local chosenPlr = findPlayer(args[2], author)
        
                                        table.insert(accounts, {chosenPlr, "master"})
                                        chat("Added "..chosenPlr.." to whitelist.")
                                    end
                                end

                                if args[3]:lower() == "remove" then
                                    if findPlayer(args[2], author) then
                                        local chosenPlr = findPlayer(args[2], author)

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
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
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
