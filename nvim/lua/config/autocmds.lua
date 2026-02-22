local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Language-specific indentation
local indent_group = augroup("FileTypeIndent", { clear = true })
local four_space_filetypes = { "cpp", "groovy", "kotlin", "java", "objc", "objcpp", "swift" }
local four_space_columns = { cpp = "120", groovy = "100", kotlin = "100", java = "120", objc = "120", objcpp = "120", swift = "120" }
for _, ft in ipairs(four_space_filetypes) do
  autocmd("FileType", {
    group = indent_group,
    pattern = ft,
    callback = function()
      vim.bo.tabstop = 4
      vim.bo.shiftwidth = 4
      vim.bo.softtabstop = 4
      vim.bo.expandtab = true
      vim.wo.colorcolumn = four_space_columns[ft]
    end,
  })
end

-- Spell check by file type
local spell_group = augroup("SpellCheck", { clear = true })
autocmd("FileType", {
  group = spell_group,
  pattern = { "markdown", "html", "eruby" },
  callback = function()
    vim.wo.spell = true
  end,
})

-- Force file types for unknowns
local filetype_group = augroup("ForceFileType", { clear = true })
local filetype_map = {
  ["*.ejs"] = "html",
  ["*.jst.ejs"] = "html",
  ["*.es6"] = "javascript",
  ["Brewfile,Dangerfile,*.danger,Podfile,*.podspec"] = "ruby",
}
for pattern, ft in pairs(filetype_map) do
  autocmd({ "BufNewFile", "BufRead" }, {
    group = filetype_group,
    pattern = vim.split(pattern, ","),
    callback = function()
      vim.bo.filetype = ft
    end,
  })
end

-- Strip trailing whitespace on save
local strip_group = augroup("StripTrailingWhitespace", { clear = true })
autocmd("BufWritePre", {
  group = strip_group,
  pattern = {
    "*.bash", "*.c", "*.cpp", "*.css", "*.diff", "*.dockerfile",
    "*.eruby", "*.groovy", "*.java", "*.js", "*.jsx",
    "*.kt", "*.md", "*.objc", "*.objcpp", "*.php", "*.py",
    "*.rb", "*.sh", "*.scss", "*.sql", "*.swift", "*.vim",
    "*.zsh", "*.yaml", "*.yml",
  },
  callback = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[%s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, pos)
  end,
})

-- Highlight on yank
local yank_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = yank_group,
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})
