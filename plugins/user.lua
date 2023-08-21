return {
  -- "Mofiqul/vscode.nvim",
  -- opts = {
  --   transparent = true,
  -- },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context"
    },
    opts = function(_, opts) -- override the options using lazy.nvim
      opts.transparent_background = true
      require("treesitter-context").setup{
        mode = 'topline',
        throttle = true, -- Throttles plugin updates (may improve performance)
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            'class',
            'function',
            'method',
          },
        },
      }
    end,
  },

  {
    "goolord/alpha-nvim",
    opts = function(_, opts) -- override the options using lazy.nvim
      local button = require("alpha.themes.dashboard").button
      opts.section.buttons.val = {
        button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
        button("s", "勒" .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
        button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
        button("q", " " .. " Quit", ":qa<CR>"),
      }
      for _, button in ipairs(opts.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      -- no opts.section.footer.opts.hl = "Type"
      opts.section.header.opts.hl = "AlphaShortcut"
      opts.section.buttons.opts.hl = "AlphaButtons"
      local width = 46
      local height = 25
      opts.section.terminal.command = "cat | " .. os.getenv("HOME") .. "/.config/nvim/lua/user/art/thisisfine.sh"
      opts.section.terminal.width = width
      opts.section.terminal.height = height
      opts.section.terminal.opts.redraw = true

      require("alpha.term")
      opts.config.layout = {
        opts.section.terminal,
        { type = "padding", val = 7},
        -- no opts.section.header,
        opts.section.buttons,
        -- no opts.section.footer,
      }
    end,
  },

  {
    "gbprod/nord.nvim",
    opts = {
      transparent = true,
    }
  },

  -- https://github.com/catppuccin/nvim
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   opts = {
  --     transparent_background = true,
  --   }
  -- },

  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      --vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end
  },
}
