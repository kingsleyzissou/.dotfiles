return {
  'mfussenegger/nvim-lint',
  lazy = false,
  event = { 'BufReadPre', 'BufNewfile' },
  config = function(_, opts)
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    local lint = require('lint')
    lint.linters_by_ft = opts.linters_by_ft

    for name, overrides in pairs(opts.linters or {}) do
      lint.linters[name] = vim.tbl_deep_extend('force', lint.linters[name] or {}, overrides)
    end

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function() require('lint').try_lint() end,
    })
  end,
}
