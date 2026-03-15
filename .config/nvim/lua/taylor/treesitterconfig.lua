-- https://github.com/nvim-treesitter/nvim-treesitter
require('nvim-treesitter').setup()

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
