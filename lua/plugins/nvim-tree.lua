return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      git = {
        enable = true,
        show_on_dirs = true,
      },
      filters = {
        git_ignored = false,
        dotfiles = false,
      },
      renderer = {
        icons = {
          glyphs = {
            git = {
              unstaged = "U",
              staged = "S",
              unmerged = "M",
              renamed = "R",
              untracked = "?",
              deleted = "D",
              ignored = "i",
            },
          },
        },
      },
    })

    local function open_nvim_tree(data)
      local directory = vim.fn.isdirectory(data.file) == 1
      if not directory then
        return
      end
      require("nvim-tree.api").tree.open()
    end

    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
  end,
}
