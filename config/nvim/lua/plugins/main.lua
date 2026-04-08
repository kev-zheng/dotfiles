return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        -- Enable ty
        ty = {
          enabled = true,
          -- Optional: ty-specific settings can go here
        },
        -- Disable conflicting LSPs
        pyright = { enabled = false },
        basedpyright = { enabled = false },
      },
      setup = {
        -- Ensure ruff (if used) doesn't conflict with ty's hover or other features
        ruff = function()
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "ruff" then
              -- Let ty handle hover/definition if there's overlap
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_organize_imports", "ruff_fix", "ruff_format" },
      },
      formatters = {
        ruff_format = {
          prepend_args = { "--line-length", "88" },
        },
      },
    },
  },
}
