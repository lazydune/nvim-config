return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6', -- または branch = '0.1.x'
    dependencies = { 
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      local telescope = require('telescope')
      
      telescope.setup({
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
        },
      })

      -- fzf 拡張のロード
      telescope.load_extension('fzf')

      -- キーバインドの設定
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'ファイル検索' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '文字列で検索(rg使用)' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'バッファ一覧' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'ヘルプ検索' })
    end
  },
}
