local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

---@diagnostic disable-next-line: redundant-parameter
null_ls.setup {
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_command [[augroup Format]]
      vim.api.nvim_command [[autocmd! * <buffer>]]
      vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
      vim.api.nvim_command [[augroup END]]

      vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format()<CR>")
    end

    -- TODO: Make range formatting work
    -- if client.server_capabilities.documentRangeFormattingProvider then
    -- vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format()<CR>")
    -- end
  end,
  sources = {
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n{#{c}}'
    }),
    null_ls.builtins.diagnostics.zsh
  }
}
