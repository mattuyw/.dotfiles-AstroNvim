return {
  -- "Mofiqul/vscode.nvim",
  -- opts = {
  --   transparent = true,
  -- },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      transparent_background = true,
    }
  },

  {
    "nvim-treesitter/nvim-treesitter-context"
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

  -- "shaunsingh/nord.nvim",
  -- "nordtheme/vim",
  {
  "gbprod/nord.nvim",
  config = function()
    require('nord').setup({
          transparent = true, -- Enable this to disable setting the background color
      }) -- set
    -- https://github.com/shaunsingh/nord.nvim/blob/master/README.md
    --vim.g.nord_disable_background = true
  end
  },

  -- https://github.com/catppuccin/nvim
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
          transparent_background = true,
    }
  },

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
