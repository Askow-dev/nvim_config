local plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
plugins_count = plugins_count + vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/opt", "*", 0, 1))

vim.g.dashboard_disable_statusline = 1
vim.g.dashboard_default_executive = "telescope"

vim.g.dashboard_custom_header = {
 " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
 " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
 " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
 " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
 " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
 " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
 " ",
 " ",
}

vim.g.dashboard_custom_section = {
    a = { description = { "  Find File                 SPC f f" }, command = "Telescope find_files" },
    b = { description = { "󱎫  Recents                   SPC f o" }, command = "Telescope oldfiles" },
    c = { description = { "󰈭  Find Word                 SPC f w" }, command = "Telescope live_grep" },
    d = { description = { "  New File                  SPC f n" }, command = "DashboardNewFile" },
    e = { description = { "  Bookmarks                 SPC b m" }, command = "Telescope marks" },
    f = { description = { "  Load Last Session         SPC s l" }, command = "SessionLoad" },
    g = { description = { "  Open Personal dotfiles    SPC f c" }, command = "Telescope find_files follow=True hidden=True cwd=~/Configuration/Dotfiles/"}
}

vim.g.dashboard_custom_footer = {
    " ",
    "Neovim Loaded " .. plugins_count .. " plugins!  ",
    "Forked from CodeArt v0.1",
	"Completely reworked and cleaned"
}

-- Disable statusline and cursorline in dashboard.
vim.cmd("autocmd BufEnter * if &ft is \"dashboard\" | set laststatus=0 | else | set laststatus=2 | endif")
vim.cmd("autocmd BufEnter * if &ft is \"dashboard\" | set nocursorline | endif")
