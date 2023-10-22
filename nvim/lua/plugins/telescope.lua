return {
  'nvim-telescope/telescope.nvim', branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find File"
    },
    {
      "<leader>fg",
      "<cmd>Telescope live_grep<cr>",
      desc = "Find Grep"
    }
  }
}
