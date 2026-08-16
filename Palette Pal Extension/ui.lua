local scripts = dofile(plugin.path .. "/scripts.lua")

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
addbutton("FGInvert", "Invert Foreground", InvertFG)
dialog:newrow{}
addbutton("BGInvert", "Invert Background", InvertBG)
dialog:newrow{}
addbutton("AnalogousPalette", "Create Analogous Palette", Analogous)
dialog:newrow{}
addbutton("MonochromaticPalette", "Create Monochromatic Palette", Monochromatic)
dialog:newrow{}
addbutton("SplitPalette", "Create Split Complementary Palette", Split)
dialog:newrow{}
addbutton("TriadicPalette", "Create Triadic Palette", Triadic)
dialog:newrow{}
addbutton("QuadraticPalette", "Create Quadratic Palette", Quadratic)

plugin:newCommand{
    id = "PalettePalDialog",
    title = "Palette Pal: Open Palette Pal Dialog",
    group = "Palette Pal",

    onclick = function ()
        dialog:show{
            wait = false
        }
    end
}