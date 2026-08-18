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
        h = (colour.hsvHue + 30) % 360,
        s = colour.hsvSaturation,
        v = colour.hsvValue
    }

    local hue2 = {
        h = (colour.hsvHue - 30) % 360,
        s = colour.hsvSaturation,
        v = colour.hsvValue
    }

    local palette = Palette(3)

    palette:setColor(0, hue1)
    palette:setColor(1, colour)
    palette:setColor(2, hue2)

    
    app.sprite:setPalette(palette)

end
addcommand("AnalogousPalette", "Create Analogous Palette", Analogous)

function Altmonochromatic()
    local scale = 0.1
    local colour = Color{
        h = app.fgColor.hsvHue,
        s = app.fgColor.hsvSaturation,
        v = app.fgColor.hsvValue
    }
    local palette = Palette(9)
    palette:setColor(4, colour)
    local dscalei = 1
    local lscalei = 1
    for i = 0, 3, 1
    do
        lscalei = lscalei + 1
        local shade = {
        h = colour.hsvHue,
        s = colour.hsvSaturation,
        v = colour.hsvValue + (scale * lscalei)
        }
        palette:setColor((3-i), shade)
    end
    for i = 5, 8, 1
    do
        dscalei = dscalei + 1
        local shade = {
        h = colour.hsvHue,
        s = colour.hsvSaturation,
        v = colour.hsvValue - (scale * dscalei)
        }
        palette:setColor(i, shade)
    end
    app.sprite:setPalette(palette)
end
addcommand("AltMonochromaticPalette", "Create Alternative Monochromatic Palette", Altmonochromatic)

--0 10, 1 20, 2 30, 3 40, 4 50, 5 60, 6 70, 7 80, 8 90, 9 100.
function Monochromatic()
    local loop = 0
    local scale = 0.1
    local colour = Color{
        h = app.fgColor.hsvHue,
        s = app.fgColor.hsvSaturation,
        v = app.fgColor.hsvValue
    }
    colour.hsvValue = 1
    local palette = Palette(11)
    palette:setColor(0, colour)
    for i = 9, 0, -1 do
        loop = loop + 1
        local shade = {
            h = colour.hsvHue,
            s = colour.hsvSaturation,
            v = colour.hsvValue - scale * loop
        }
        palette:setColor(10 - i, shade)
    end
    app.sprite:setPalette(palette)
end
addcommand("MonochromaticPalette", "Create Monochromatic Palette", Monochromatic)

function Split()
    local colour = Color{
        h = app.fgColor.hsvHue,
        s = app.fgColor.hsvSaturation,
        v = app.fgColor.hsvValue
    }
    local hue1 = {
        h = (colour.hsvHue + (180 + 30)) % 360,
        s = colour.hsvSaturation,
        v = colour.hsvValue
    }

    local hue2 = {
        h = (colour.hsvHue + (180 - 30)) % 360,
        s = colour.hsvSaturation,
        v = colour.hsvValue
    }

    local palette = Palette(3)

    palette:setColor(0, hue1)
    palette:setColor(1, colour)
    palette:setColor(2, hue2)
    app.sprite:setPalette(palette)
end

addcommand("SplitPalette", "Create Split Complementary Palette", Split)

function Triadic()
    local colour = Color{
        h = app.fgColor.hsvHue,
        s = app.fgColor.hsvSaturation,
        v = app.fgColor.hsvValue
    }
    local hue1 = {
        h = (colour.hsvHue + 120) % 360,
        s = colour.hsvSaturation,
        v = colour.hsvValue
    }

    local hue2 = {
        h = (colour.hsvHue - 120) % 360,
        s = colour.hsvSaturation,
        v = colour.hsvValue
    }

    local palette = Palette(3)

    palette:setColor(0, hue1)
    palette:setColor(1, colour)
    palette:setColor(2, hue2)
    app.sprite:setPalette(palette)
end

addcommand("TriadicPalette", "Create Triadic Palette", Triadic)

function Quadratic()
    local colour = Color{
        h = app.fgColor.hsvHue,
        s = app.fgColor.hsvSaturation,
        v = app.fgColor.hsvValue
    }
    local hue1 = {
        h = (colour.hsvHue - 90) % 360,
        s = colour.hsvSaturation,
        v = colour.hsvValue
    }
    local hue2 = {
        h = (colour.hsvHue + 90) % 360,
        s = colour.hsvSaturation,
        v = colour.hsvValue
    }
    
        local hue3 = {
        h = (colour.hsvHue + 180) % 360,
        s = colour.hsvSaturation,
        v = colour.hsvValue
    }
    local palette = Palette(4)
    palette:setColor(0, hue1)
    palette:setColor(1, colour)
    palette:setColor(2, hue2)
    palette:setColor(3, hue3)
    app.sprite:setPalette(palette)
end

addcommand("QuadraticPalette", "Create Quadratic Palette", Quadratic)