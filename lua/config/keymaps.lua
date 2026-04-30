-- TerminalモードからEscキーでNormalモードに戻れるようにする
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], {noremap = true})

-- ウィンドウ移動を楽にする（Terminalモードから直接移動できるように 't' で設定）
vim.keymap.set('t', '<C-w><C-h>', [[<C-\><C-n><C-w>h]], {noremap = true})
vim.keymap.set('t', '<C-w><C-j>', [[<C-\><C-n><C-w>j]], {noremap = true})
vim.keymap.set('t', '<C-w><C-k>', [[<C-\><C-n><C-w>k]], {noremap = true})
vim.keymap.set('t', '<C-w><C-l>', [[<C-\><C-n><C-w>l]], {noremap = true})

