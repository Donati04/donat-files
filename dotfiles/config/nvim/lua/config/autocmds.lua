-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local tex_group = vim.api.nvim_create_augroup("LatexShortcuts", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  group = tex_group,
  callback = function()
    local opts = { buffer = true }
    vim.keymap.set("i", "<C-b>", "\\textbf{}<Left>", opts)
    vim.keymap.set("i", "<C-l>", "\\textit{}<Left>", opts)
    vim.keymap.set("i", "<C-t>", "\\textcolor{}{}<Left>", opts)
    vim.keymap.set("v", "<C-b>", 'c\\textbf{<C-r>"}<Esc>', opts)
    vim.keymap.set("v", "<C-l>", 'c\\textit{<C-r>"}<Esc>', opts)
    vim.keymap.set("v", "<C-t>", 'c\\textcolor{}{<C-r>"}<Esc>', opts)
  end,
})
