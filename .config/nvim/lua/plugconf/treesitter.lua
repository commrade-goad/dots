local max_filesize = 100 * 1024 -- 100KB

require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "cpp", "lua"},
    sync_install = false,

    modules = {},
    ignore_install = {},
    auto_install = true,
    highlight = {
        enable = true,
        disable = function(_, buf)
            local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = true,
    }
}
