local Lovense, Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/stellar-4242/Source/main/LovenseRBLX.lua'))()
if not getgenv().ErrorInvoked then Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/laderite/bleklib/main/library.lua"))() end

if Library then
    local Menu = Library:Create({
        Name = "Sexual Toy Controller";
        StartupSound = {
            Toggle = true;
            SoundID = "rbxassetid://6958727243";
            TimePosition = 1
        };
    })
    local Settings = {
        -- Maximum Intensity; 20
        Vibration = {
            Intensity = 5; Length = 60;
        };
        
        Rotation = {
            Intensity = 5; Length = 60;
        };
    }
    
    local Vibration, Rotation, Elements = Menu:Tab("Vibration Menu"), Menu:Tab('Rotation Menu'),
    {
        Vibration = {
            Slider1 = {'Intensity', {1; 20}};
            Slider2 = {'Length', {60; 360}};
            Button1 = {'Send Vibrations!', function()
                local Vibrate = Promise.promisify(Lovense.Vibrate); Vibrate(Settings.Vibration.Intensity, Settings.Vibration.Length):catch(warn)
            end}
        };
        Rotation = {
            Slider1 = {'Intensity', {1; 20}};
            Slider2 = {'Length', {60; 360}};
            Button1 = {'Rotate that cock!', function()
                local Rotate = Promise.promisify(Lovense.Rotate); Rotate(Settings.Rotation.Intensity, Settings.Rotation.Length):catch(warn)
            end}    
        }
    }
    
    function RegisterElements(menu: table)
        for key, value in next, menu do
            if menu == Elements.Vibration then
                if key:match('Slider') then
                    Vibration:Slider(value[1], Settings.Vibration[value[1]], value[2][1], value[2][2], function(number)
                        if Settings.Vibration[value[1]] then
                            Settings.Vibration[value[1]] = number
                        end
                    end)
                elseif key:match('Button') then
                    Vibration:Button(value[1], value[2])
                end
            elseif menu == Elements.Rotation then
                if key:match('Slider') then
                    Rotation:Slider(value[1], Settings.Rotation[value[1]], value[2][1], value[2][2], function(number)
                        if Settings.Rotation[value[1]] then
                            Settings.Rotation[value[1]] = number
                        end
                    end)
                elseif key:match('Button') then
                    Rotation:Button(value[1], value[2])
                end 
            end
        end
    end
    
    RegisterElements(Elements.Vibration); RegisterElements(Elements.Rotation)
end
    
