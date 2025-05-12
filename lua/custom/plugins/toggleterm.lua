return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    -- Konfigurasi default di sini
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'float',
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = 'curved',
      winblend = 0,
      highlights = {
        border = 'Normal',
        background = 'Normal',
      },
    },
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)

    -- Keymaps kustom bisa ditambahkan di sini
    function _G.set_terminal_keymaps()
      local opts_term = { buffer = 0 }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts_term)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts_term)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts_term)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts_term)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts_term)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts_term)
    end

    vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

    -- Tambahkan keymaps untuk toggle terminal
    vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<CR>', { desc = 'Toggle terminal' })
    vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', { desc = 'Toggle float terminal' })
    vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', { desc = 'Toggle horizontal terminal' })
    vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<CR>', { desc = 'Toggle vertical terminal' })
  end,
}
