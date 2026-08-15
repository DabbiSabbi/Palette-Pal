local scripts = ("Palette Pal Extension/scripts.lua")

local dialog = Dialog{
    title = "Palette Pal",
    onclose = function ()
    end
}

local function addbutton(id, text, script)
    dialog:button{
        id = id,
        text = text,
        onclick = script
    }
end
addbutton("FGInvert", "Invert Foreground", scripts.FGInvert)
addbutton("BGInvert", "Invert Background", scripts.BGInvert)
addbutton("AnalogousPalette", "Create Analogous Palette", scripts.Analogous)
plugin:newCommand{
    id = "PalettePalDialog",
    title = "Open Palette Pal Dialog",
    group = "Palette Pal",

    onclick = function ()
        dialog:show{
            wait = false
        }
    end
}