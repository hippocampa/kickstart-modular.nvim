return {
  -- { 'numToStr/Comment.nvim', opts = {} },
  {
    'numToStr/Comment.nvim',
    keys = { -- Lazy-load hanya ketika keybinding dipakai
      {
        '<leader>/',
        function()
          require('Comment.api').toggle.linewise.current()
        end,
        desc = 'Toggle Comment',
      },
      { '<leader>/', "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", mode = 'v', desc = 'Toggle Comment' },
    },
    config = function()
      require('Comment').setup {
        -- Nonaktifkan keybinding default (kita pakai <Leader>/ saja)
        mappings = {
          basic = false, -- Matikan `gcc`, `gbc`, dll.
          extra = false, -- Matikan fitur tambahan
        },
      }
    end,
  },
}
