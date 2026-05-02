return {
    "vim-skk/skkeleton",
    dependencies = { "vim-denops/denops.vim" },
    config = function()
        local function get_skk_dict()
            local candidates = {
                -- 1. Ubuntu (今インストールしたもの)
                "/usr/share/skk/SKK-JISYO.L",
                -- 2. WSLから見たWindows側の辞書 (ユーザー名 reiji 用)
                "/mnt/c/Users/reiji/AppData/Roaming/corvusskk/skk-jisyo.l",
                -- 3. WindowsネイティブでNeovimを起動した場合
                vim.fn.expand("~/AppData/Roaming/corvusskk/skk-jisyo.l"),
            }

            for _, path in ipairs(candidates) do
                if vim.fn.filereadable(path) == 1 then
                    return { path }
                end
            end
            return {} -- どこにもない場合は空
        end
        vim.fn["skkeleton#config"]({
            globalDictionaries = get_skk_dict(),
            eggLikeNewline = true,
            keepState = false,
        })
        vim.keymap.set({ "i", "c", "t" }, "<C-j>", "<Plug>(skkeleton-toggle)", { silent = true })
    end,
}

