local function addcommand(id, title, func)
    plugin:newCommand{
    id = id,
    title = title,
    group = "Palette Pal",

    onclick = func
    end
}

function InvertFG()
    local colour = {
        r = app.fgColor.red,
        g = app.fgColor.green,
        b = app.fgColor.blue
    }
    colour.r = 255 - colour.r
    colour.g = 255 - colour.g
    colour.b = 255 - colour.b

    app.fgColor = colour
end
addcommand("InvertForegroundColour", "Invert Foreground Colour", InvertFG)

function InvertBG()
    local colour = {
        r = app.bgColor.red,
        g = app.bgColor.green,
        b = app.bgColor.blue
    }
    colour.r = 255 - colour.r
    colour.g = 255 - colour.g
    colour.b = 255 - colour.b

    app.bgColor = colour
end
addcommand("InvertBackgroundColour", "Invert Background Colour", InvertBG)

function Analogous()
    local colour = {
        h = app.fgColor.hsvHue,
        s = app.fgColor.hsvSaturation,
        v = app.fgColor.hsvValue
    }
    local hue1 = colour.h + 30
    local hue2 = colour.h - 30
    local palette = Palette(3)
    palette:setcolor(1, colour)
    palette:setcolor(0, hue1)
    palette:setcolor(2, hue2)
end
addcommand("AnalogousPalette", "Create Analogous Palette", Analogous)