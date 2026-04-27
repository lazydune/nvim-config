return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({
      signcolumn = true,  -- 左側のサインを表示
      numhl      = true,  -- 行番号に色をつける
      linehl     = false, -- 行全体に色をつける (うるさければfalseに)
      word_diff  = true,  -- 行内のどの単語が変わったかまで強調する
      show_deleted = true,
      signs = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- 次の変更点 / 前の変更点へ移動
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, {expr=true})

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, {expr=true})

        map('n', '<leader>hr', gs.reset_hunk)
      end
    })
    vim.api.nvim_set_hl(0, 'GitSignsDeleteVirtLn', { fg = '#fb4934', bg = '#3c3836' })
  end
}
