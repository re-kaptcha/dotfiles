local M = {}
local utils = require('utils')

M.tool_names = {
  'csharpier',
  {
    'editorconfig_checker',
    alias = 'editorconfig-checker',
  },
  'eslint_d',
  'flake8',
  {
    'prettierd',
    opts = {
      env = {
        PRETTIERD_DEFAULT_CONFIG = vim.fn.stdpath('config') .. '/configs/.prettierrc.json',
      },
    },
  },
  'pylint',
  'stylua',
  'taplo',
  'yamllint',
}

function M.lsp_formatting(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      -- apply whatever logic you want (in this example, we'll only use null-ls)
      return client.name == 'null-ls'
    end,
    bufnr = bufnr,
  })
  utils.info('Formatted ' .. vim.api.nvim_buf_get_name(bufnr) .. ' successfully', 'null_ls formatting')
end

return M
