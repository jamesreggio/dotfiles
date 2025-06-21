return {
  -- Sensible defaults
  { "tpope/vim-sensible" },

  -- Git
  { "tpope/vim-fugitive" },
  { "tpope/vim-git" },

  -- Status and tablines
  { "nvim-lualine/lualine.nvim" },
  { "nanozuki/tabby.nvim" },

  -- Commenting and editing helpers
  { "tpope/vim-commentary" },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },

  -- Motions
  { "justinmk/vim-sneak" },

  -- Search enhancements
  { "nelstrom/vim-visual-star-search" },

  -- Session management
  { "tpope/vim-obsession" },

  -- Undo history
  { "mbbill/undotree" },

  -- Telescope and dependencies
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- File navigation
  { "nvim-neo-tree/neo-tree.nvim" },
  { "nvim-tree/nvim-web-devicons" },

  -- Syntax highlighting and structure
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-treesitter/playground" },

  -- Theme and UI components
  { "RRethy/base16-nvim" },
  { "rebelot/kanagawa.nvim" },
  { "MunifTanjim/nui.nvim" },

  -- Completion and LSP
  { "neoclide/coc.nvim", branch = "release" },

  -- Command utilities
  { "vim-scripts/sudo.vim" },
  { "danro/rename.vim" },
}
