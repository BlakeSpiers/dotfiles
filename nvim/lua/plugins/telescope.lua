return {
  'nvim-telescope/telescope.nvim', branch = '0.1.x',
  dependencies = { 
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', 
        --build = 'make' 
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
  },
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find File"
    },
    {
      "<leader>fl",
      "<cmd>Telescope live_grep<cr>",
      desc = "Find Grep"
    },
    {
      "<leader>fb",
      function()
          require("telescope.builtin").buffers()
      end,
      desc = "Find Buffers"
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Find Help Tags"
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").grep_string({ shorten_path = true, word_match = "-w", only_sort_text = true, search = ''})
      end,
      desc = "Find Help Tags"
    }
  },
}
