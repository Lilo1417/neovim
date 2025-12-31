vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>nt", ":Neotree filesystem reveal right<CR>")

vim.keymap.set('n', '<leader>fn', function()
  local snippet = [[#include<bits/stdc++.h>

using namespace std;

#define int int64_t

signed main() {
    cin.tie(0);
    ios_base::sync_with_stdio(0);

    return 0;
}]]
  vim.api.nvim_put(vim.split(snippet, '\n'), 'l', true, true)
end, { desc = "Insert Lua function template" })

