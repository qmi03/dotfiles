return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    local utils = require("utils")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")
    local util = require("lspconfig.util")
    local vue_language_server_path = "/etc/profiles/per-user/qmi/bin/vue-language-server"
    local on_attach = function(client, bufnr)
      local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
      end
      local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
      end

      buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
      local opts = { noremap = true, silent = true }

      buf_set_keymap("n", "gD", "<cmd>Telescope lsp_type_definitions<CR>", opts)
      buf_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
      buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
      buf_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
      buf_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
      buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
      buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
      buf_set_keymap("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", opts)
      buf_set_keymap("n", "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.diagnostic.config({ update_in_insert = true })
      client.server_capabilities.document_formatting = true
    end
    lspconfig.ruff.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    if utils.executable("pylsp") then
      local venv_path = os.getenv("VIRTUAL_ENV")
      local py_path = nil
      local curr_path = utils.check_python_executable()
      if curr_path == nil or curr_path.path == nil then
        py_path = vim.g.python3_host_prog
      else -- decide which Python executable to use for mypy
        if venv_path then
          py_path = venv_path .. "/bin/python3"
        else
          py_path = curr_path.path
        end
      end
      lspconfig.pylsp.setup({
        on_attach = on_attach,
        settings = {
          pylsp = {
            plugins = {
              -- formatter options
              black = { enabled = false },
              autopep8 = { enabled = false },
              yapf = { enabled = false },
              -- linter options
              -- wait for ruff to be stable for both linting and formatting then I'll be replacing black and pylint with ruff
              pylint = { enabled = false, executable = "pylint" },
              ruff = { enabled = false },
              pyflakes = { enabled = false },
              pycodestyle = { enabled = false },
              -- type checker
              pylsp_mypy = {
                enabled = true,
                overrides = { "--python-executable", py_path, "--ignore-missing-imports", false },
                report_progress = true,
                live_mode = false,
              },
              -- auto-completion options
              jedi_completion = { fuzzy = true },
              -- import sorting
              isort = { enabled = true },
            },
          },
        },
        flags = {
          debounce_text_changes = 200,
        },
        capabilities = capabilities,
      })
    else
      vim.notify("pylsp not found!", vim.log.levels.WARN, { title = "Nvim-config" })
    end
    lspconfig.rust_analyzer.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "rust" },
      root_dir = util.root_pattern("Cargo.toml"),
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
          },
        },
      },
    })
  end,
}
