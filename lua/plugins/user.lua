-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- {
  --   "folke/which-key.nvim",
  --   enabled = false,
  -- },
  -- == Examples of Overriding Plugins ==
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "jonarrien/telescope-cmdline.nvim",
    },
    keys = {
      -- { ":", "<cmd>Telescope cmdline<cr>", desc = "Cmdline" },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension "cmdline"
    end,
  },
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " ______           __                   ",
        "/\\  _  \\         /\\ \\__                ",
        "\\ \\ \\L\\ \\    ____\\ \\ ,_\\  _ __   ___   ",
        " \\ \\  __ \\  /',__\\\\ \\ \\/ /\\`'__\\/ __`\\ ",
        "  \\ \\ \\/\\ \\/\\__, `\\\\ \\ \\_\\ \\ \\//\\ \\L\\ \\",
        "   \\ \\_\\ \\_\\/\\____/ \\ \\__\\\\ \\_\\\\ \\____/",
        "    \\/_/\\/_/\\/___/   \\/__/ \\/_/ \\/___/ ",
        " ",
        " __  __  __  __                     ",
        "/\\ \\/\\ \\/\\ \\/\\ \\  __                ",
        "\\ \\ `\\\\ \\ \\ \\ \\ \\/\\_\\    ___ ___    ",
        " \\ \\ , ` \\ \\ \\ \\ \\/\\ \\ /' __` __`\\  ",
        "  \\ \\ \\`\\ \\ \\ \\_/ \\ \\ \\/\\ \\/\\ \\/\\ \\ ",
        "   \\ \\_\\ \\_\\ `\\___/\\ \\_\\ \\_\\ \\_\\ \\_\\",
        "    \\/_/\\/_/`\\/__/  \\/_/\\/_/\\/_/\\/_/",
      }
      return opts
    end,
  },
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_background = "medium"
    end,
  },
  {
    "wookayin/semshi",
    ft = "python",
    build = ":UpdateRemotePlugins",
    init = function() vim.g["semshi#excluded_hl_groups"] = {} end,
    config = function()
      local function set_semshi_hl()
        vim.api.nvim_set_hl(0, "semshiLocal", { ctermfg = 209, fg = "#80aa9e" })
        vim.api.nvim_set_hl(0, "semshiGlobal", { ctermfg = 214, fg = "#d3869b" })
        vim.api.nvim_set_hl(0, "semshiImported", { ctermfg = 214, fg = "#8bba7f", bold = true })
        vim.api.nvim_set_hl(0, "semshiParameter", { ctermfg = 75, fg = "#fabd2f" })
        vim.api.nvim_set_hl(0, "semshiParameterUnused", { ctermfg = 117, fg = "#d79921", underline = true })
        vim.api.nvim_set_hl(0, "semshiFree", { ctermfg = 218, fg = "#a89984" })
        vim.api.nvim_set_hl(0, "semshiBuiltin", { ctermfg = 207, fg = "#f2594b" })
        vim.api.nvim_set_hl(0, "semshiAttribute", { ctermfg = 49, fg = "#458588" })
        vim.api.nvim_set_hl(0, "semshiSelf", { ctermfg = 249, fg = "#fe8019" })
        vim.api.nvim_set_hl(0, "semshiUnresolved", { ctermfg = 226, fg = "#d65d0e", underline = true })
        vim.api.nvim_set_hl(0, "semshiSelected", { ctermfg = 231, fg = "#fbf1c7", ctermbg = 161, bg = "#4c3432" })
        vim.api.nvim_set_hl(0, "semshiErrorSign", { ctermfg = 231, fg = "#fbf1c7", ctermbg = 160, bg = "#402120" })
        vim.api.nvim_set_hl(0, "semshiErrorChar", { ctermfg = 231, fg = "#fbf1c7", ctermbg = 160, bg = "#402120" })
        vim.cmd [[sign define semshiError text=E> texthl=semshiErrorSign]]
      end
      vim.api.nvim_create_autocmd("Colorscheme", {
        pattern = "*",
        group = vim.api.nvim_create_augroup("semshi_colorscheme", { clear = true }),
        callback = set_semshi_hl,
      })
      set_semshi_hl()
    end,
    keys = {
      n = {
        ["<leader>s"] = { name = "Semshi" },
        ["<leader>se"] = { ":Semshi enable<cr>", desc = "Enable Semshi coloring" },
      },
    },
  },
  {
    "icebreaker/gustav.vim",
    ft = "markdown",
    keys = {
      n = {
        ["<leader>-"] = { ":call gustav#add()<CR>", desc = "Add GFM checkbox to item" },
        ["<leader>="] = { ":call gustav#toggle()<CR>", desc = "Toggle GFM checkbox status" },
      },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
  },
  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    ft = "markdown",
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- Optional
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "13th Age - Stone Thief",
          path = "~/Ludothèque/TTRPGs/campaigns/13A-Stone-Thief",
        },
        {
          name = "OSE - Marches du Nord",
          path = "~/Ludothèque/TTRPGs/campaigns/OSE-marches-du-nord",
        },
      },
    },
  },
  {
    "folke/zen-mode.nvim",
    lazy = true,
    dependencies = {
      "folke/twilight.nvim",
    },
    keys = {
      -- Zen Mode
      { "<leader>z", ":ZenMode<cr>", desc = "Toggle Zen Mode" },
    },
    opts = {},
  },
  {
    "folke/twilight.nvim",
    opts = {},
    keys = {
      n = {
        ["<leader>T"] = { ":Twilight<CR>", desc = "Toggle Twilight HL" },
      },
    },
  },
  {
    "f3fora/nvim-texlabconfig",
    config = function() require("texlabconfig").setup() end,
    ft = { "tex", "bib" }, -- Lazy-load on filetype
    build = "go build",
    -- build = 'go build -o ~/.bin/' if e.g. ~/.bin/ is in $PATH
  },
  {
    "mustache/vim-mustache-handlebars",
    opts = {},
    ft = "handlebars",
  },
  {
    "andrewferrier/wrapping.nvim",
    config = function() require("wrapping").setup() end,
  },
  {
    "Fymyte/rasi.vim",
    ft = "rasi",
  },
  {
    "sile-typesetter/vim-sile",
    ft = "sile",
  },
}
