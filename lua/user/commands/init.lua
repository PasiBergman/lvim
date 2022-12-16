-- Open terminal window in split view
vim.cmd [[command ExecVsh set splitright | vnew | set filetype=sh | read !sh #]]
-- Open terminal window below
vim.cmd [[command ExecSh set splitbelow | new | set filetype=sh | read !sh #]]
