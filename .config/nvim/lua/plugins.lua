vim.cmd('packadd packer.nvim')

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	--syntax
	use 'ntpeters/vim-better-whitespace' -- 文末スペースをハイライト
  use {
    'nvim-treesitter/nvim-treesitter', -- コードに色つける
    requires = {
      'nvim-treesitter/nvim-treesitter-context', --関数名の上部表示
      -- 'haringsrob/nvim_context_vt', --カッコ対応
      'm-demare/hlargs.nvim', --引数の色変更
      'David-Kunz/treesitter-unit', --いい感じに選択
      'nvim-treesitter/playground', --構文木
      -- 'RRethy/nvim-treesitter-endwise'
    },
    config = function() require('config.treesitter') end,
    run = ':TSUpdate',
  }

  -- schema
  use {
    'tomasiser/vim-code-dark', -- VScode風カラー
    config = function() vim.cmd('colorscheme codedark') end
  }

  --coc
  use {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function() require('config.coc') end,
  }

  use {
    'antoinemadec/coc-fzf',
    branch = 'release',
    requires = {
      {
        'junegunn/fzf',
        run = ':call fzf#install()'
      },
      { 'Junegunn/fzf.vim' },
    },
    config = function()
      vim.g.fzf_layout = { window = { width = 0.9, height = 0.6 } }
    end
  }

  use {
    'phaazon/hop.nvim',
    branch = 'v1',
    config = function()
      require 'hop'.setup{ keys = 'etoxgfblzhckisuran' }
    end
  }

  -- いい感じインデント
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      vim.opt.list = true
      vim.opt.listchars:append("space:⋅")
      vim.opt.listchars:append("eol:↴")


      local highlight = {
        "RainbowCyan",
      }

      local hooks = require "ibl.hooks"

      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "E06C75" })
      end)

      require ("ibl").setup {
        indent = { highlight = highlight }
      }
    end
  }

end)
