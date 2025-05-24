local custom_color = {
    base00 = '#1E1E1E', -- background
    base01 = '#2E2E2E', -- dim0
    base02 = '#3A3A3A', -- dim3 (selection bg)
    base03 = '#6E6E6E', -- dim7 (comments)
    base04 = '#8A8A8A', -- regular7 (dark fg)
    base05 = '#F0F0F0', -- foreground
    base06 = '#E0E0E0', -- bright0
    base07 = '#FFFFFF', -- bright white or light bg
    base08 = '#C4B0B0', -- regular1 (red)
    base09 = '#D0B8B8', -- bright1 (orange)
    base0A = '#C4C4B0', -- regular3 (yellow)
    base0B = '#B0C4B0', -- regular2 (green)
    base0C = '#B0C4C4', -- regular6 (cyan)
    base0D = '#B0B0C4', -- regular4 (blue)
    base0E = '#C4B0C4', -- regular5 (purple)
    base0F = '#AAAAAA', -- dim1 (brown/fallback)
    -- base0F = '#3A2E2E', -- dim1 (brown/fallback)
}

vim.api.nvim_set_hl(0, "TrailingWhitespace", { bg = "#C4B0B0" })

function ReColorMyEditor()
    require('base16-colorscheme').setup(custom_color)
end

return custom_color

-- local custom_color = {
--     base00 = '#2D353B', base01 = '#3D484D', base02 = '#4F585E', base03 = '#7A8478',
--     base04 = '#877f6d', base05 = '#D3C6AA', base06 = '#DBBC7F', base07 = '#A7C080',
--     base08 = '#E67E80', base09 = '#DBBC7F', base0A = '#83C092', base0B = '#A7C080',
--     base0C = '#7FBBB3', base0D = '#D699B6', base0E = '#7FBBB3', base0F = '#baae96'
-- }
--
-- vim.api.nvim_set_hl(0, "TrailingWhitespace", { bg = "#E67E80" })
--
-- function Reapply_color()
--     require('base16-colorscheme').setup(custom_color)
-- end
--
-- return custom_color
