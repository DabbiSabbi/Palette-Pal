Sprite = app.sprite

local function addcommand(id, title, func)
    plugin:newCommand{
    id = id,
    title = "Palette Pal: " .. title,
    group = "Palette Pal",

    onclick = func
}
end

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
    local colour = Color{
        h = app.fgColor.hsvHue,
        s = app.fgColor.hsvSaturation,
        v = app.fgColor.hsvValue
    }

    local hue1 = {
        h = colour.hsvHue + 30,
        s = colour.hsvSaturation,
        v = colour.hsvValue
    }

    local hue2 = {
        h = colour.hsvHue - 30,
        s = colour.hsvSaturation,
        v = colour.hsvValue
    }

    local palette = Palette(3)

    palette:setColor(0, hue1)
    palette:setColor(1, colour)
    palette:setColor(2, hue2)

    
    Sprite:setPalette(palette)

end
addcommand("AnalogousPalette", "Create Analogous Palette", Analogous)

function Monochromatic()
    local scale = 0.15
    local colour = Color{
        r = app.fgColor.red,
        g = app.fgColor.green,
        b = app.fgColor.blue
    }
    local palette = Palette(9)
    palette:setColor(4, colour)
    local dscalei = 1
    local lscalei = 1
    for i = 0, 3, 1
    do
        lscalei = lscalei + 1
        local shade = {
            r = app.fgColor.red,
            g = app.fgColor.green,
            b = app.fgColor.blue
        }
        shade.r = colour.r * ( 1 + (scale * scalei))
        shade.g = colour.g * ( 1 + (scale * scalei))
        shade.b = colour.b * ( 1 + (scale * scalei))
        palette:setColor(i, shade)
    end
    for i = 5, 8, 1
    do
        dscalei = dscalei + 1
        local shade = {
            r = app.fgColor.red,
            g = app.fgColor.green,
            b = app.fgColor.blue
        }
        shade.r = colour.r * ( 1 - (scale * scalei))
        shade.g = colour.g * ( 1 - (scale * scalei))
        shade.b = colour.b * ( 1 - (scale * scalei))
        palette:setColor(i, shade)
    end
    Sprite:setPalette(palette)
end
addcommand("MonochromaticPalette", "Create Monochromatic Palette", Monochromatic)