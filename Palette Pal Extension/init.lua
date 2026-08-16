function init(plugin)
    _G.plugin = plugin
    dofile(plugin.path .. "/ui.lua")
end