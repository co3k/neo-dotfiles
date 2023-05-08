local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use({ "wbthomason/packer.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use({ "gpanders/editorconfig.nvim" })
  use({ "folke/noice.nvim", config = function() require('noice').setup() end })
  use({ 'MunifTanjim/nui.nvim' })
  use({ 'ggandor/lightspeed.nvim' })
  use({ 'airblade/vim-gitgutter' })
  use({ 'stonelasley/flare.nvim' })
  use({ 'yioneko/nvim-yati' })
  use({ 'nvim-telescope/telescope.nvim' })
  use({ 'nvim-telescope/telescope-github.nvim' })
  use({ 'SmiteshP/nvim-navic' })
  use({ 'jinh0/eyeliner.nvim' })
  use({ 'kosayoda/nvim-lightbulb', config = function()
    require('nvim-lightbulb').setup({
      autocmd = {enabled = true},
    })
  end })
  use({ 'antoinemadec/FixCursorHold.nvim' })
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
--          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.completion.spell,
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                lsp_formatting(bufnr)
              end,
            })
          end
        end,
      })
    end,
    requires = { "nvim-lua/plenary.nvim" },
})
  use({ 'sindrets/diffview.nvim' })
  use({ 'junegunn/fzf.vim' })
  use({ 'TimUntersberger/neogit' })
  use({ 'camgraff/telescope-tmux.nvim' })
  use({ 'jubnzv/virtual-types.nvim' })
  use({ 'PHSix/faster.nvim' })
  use({ 'luochen1990/rainbow' })
  use({ 'linty-org/key-menu.nvim' })
  use({ 'kkharji/lspsaga.nvim' })
  use({ 'j-hui/fidget.nvim', config = function() require('fidget').setup() end })
  use({ 'm-demare/hlargs.nvim', config = function() require('hlargs').setup() end })
  use({ 'weilbith/nvim-code-action-menu' })
  use({ 'RishabhRD/popfix' })
  use({ 'RishabhRD/nvim-lsputils' })
  use({ 'Maan2003/lsp_lines.nvim', config = function() require('lsp_lines').setup() end })
  use({ 'EdenEast/nightfox.nvim' })
  use({ 'tpope/vim-sleuth' })
  use({ 'github/copilot.vim' })
  use({ 'kyazdani42/nvim-web-devicons', config = function() require('nvim-web-devicons').setup() end })
  use({ 'folke/trouble.nvim', config = function()
    require('trouble').setup({
      auto_preview = true,
      use_diagnostic_signs = true,
    })
  end })
  use({ 'rbtnn/vim-ambiwidth' })
  use({ 'lukas-reineke/indent-blankline.nvim', config = function() require('indent_blankline').setup() end })
  use({ 'jeffkreeftmeijer/neovim-sensible' })
  use({ 'jghauser/mkdir.nvim' })
  use({ 'neovim/nvim-lspconfig' })
  use({ 'williamboman/mason.nvim' })
  use({ 'williamboman/mason-lspconfig.nvim' })
  use({ 'hrsh7th/nvim-cmp' })
  use({ 'onsails/lspkind.nvim' })
  use({ 'hrsh7th/vim-vsnip' })
  use({ 'hrsh7th/cmp-nvim-lsp' })
  use({ 'hrsh7th/cmp-nvim-lsp-signature-help' })
  use({ 'hrsh7th/cmp-nvim-lsp-document-symbol' })
  use({ 'hrsh7th/cmp-buffer' })
  use({ 'hrsh7th/cmp-path' })
  use({ 'petertriho/cmp-git', config = function() require('cmp_git').setup() end })
  use({ 'folke/lsp-colors.nvim' })
  use({ 'petertriho/nvim-scrollbar', config = function()
    require('scrollbar').setup()
    require('scrollbar.handlers.search').setup()
  end })
  use({ 'nvim-lualine/lualine.nvim', config = function()
    require('lualine').setup({
      sections = {
        lualine_c = {
          { "filename" },
          { 'require("nvim-navic").get_location()' },
        },
      },
    })
  end })
  use({ 'kevinhwang91/nvim-hlslens' })
  use({ 'akinsho/git-conflict.nvim' })
  use({ 'rhysd/committia.vim' })
  use({ 'hotwatermorning/auto-git-diff' })
  use({ 'pwntester/octo.nvim', config = function() require('octo').setup() end })
  use({ 'ojroques/vim-oscyank', branch = 'main' })
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "lua" },
        sync_install = true,
        auto_install = true,
      })
      res = vim.api.nvim_cmd({cmd = "TSUpdate"}, {output = true})
    end,
  })
  use({ 'junegunn/fzf', run = ":call fzf#install()" })
  use({ 'junegunn/fzf.vim' })
  use({ 'lotabout/skim', dir = '~/.skim', run = './install' })
  use({ 'lotabout/skim.vim' })
  use({ 'akinsho/bufferline.nvim', tag = 'v2.*', config = function() require("bufferline").setup() end })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
