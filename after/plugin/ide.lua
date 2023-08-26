local bufferlist = require('ide.components.bufferlist')
local explorer = require('ide.components.explorer')
local outline = require('ide.components.outline')
local callhierarchy = require('ide.components.callhierarchy')

--[[
require('ide').setup({
    panels = {
        left = "explorer"
    },
    panel_groups = {
        explorer = { outline.Name, bufferlist.Name, explorer.Name, callhierarchy.Name },
},
workspaces = {
    auto_open = "left",}})
    --]]
