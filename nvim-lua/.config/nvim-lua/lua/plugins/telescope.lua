return {
  'nvim-telescope/telescope.nvim', branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>" },
    { "<leader>fr", "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
    { "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>" },
    { "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>" },
  },
  opts = {
    pickers = {
      find_files = {
        previewer = false,
      }
    }
  }
}
