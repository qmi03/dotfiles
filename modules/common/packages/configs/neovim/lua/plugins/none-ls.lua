return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					-- js
					-- require("none-ls.diagnostics.eslint_d"),
					null_ls.builtins.formatting.prettier,
					-- lua
					null_ls.builtins.formatting.stylua,
					-- ruby
					null_ls.builtins.formatting.rubocop,
					null_ls.builtins.diagnostics.rubocop,
					-- nix format
					null_ls.builtins.formatting.nixpkgs_fmt,
					-- swift and c
					-- null_ls.builtins.formatting.clang_format,
					null_ls.builtins.formatting.swiftformat,
					null_ls.builtins.diagnostics.swiftlint,
					null_ls.builtins.diagnostics.checkmake,
					-- typst
					null_ls.builtins.formatting.typstfmt,
				},
			})
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
		event = { "BufReadPre", "BufNewFile" },
	},
}
