local installer_present, installer = pcall(require, "mason-tool-installer")

if not installer_present then
	vim.notify("Failed to initialize Mason Tool Installer!")
	return
end

local M = {}

M.setup = function()
	installer.setup({
		ensure_installed = {
			"actionlint",
			"codespell",
			"eslint_d",
			"prettierd",
			"shellcheck",
			"shfmt",
			"stylua",
			"yamllint",
			"ruff",
			"mypy",

			-- LSPs
			-- NOTE: you do not need to add `elixir-ls` here.. it is now handled by
			-- the elixir plugin. This is because Mason does not support downloading
			-- and building LSPs using the project runtime. For more info see:
			-- https://github.com/elixir-lsp/elixir-ls/issues/193
			-- https://dragoshmocrii.com/fix-vscode-elixirls-intellisense-for-code-imported-with-use/

			"ansible-language-server",
			"arduino-language-server",
			"bash-language-server",
			"clangd",
			"cmake-language-server",
			"css-lsp",
			"dockerfile-language-server",
			"elm-language-server",
			"erlang-ls",
			"eslint-lsp",
			"gopls",
			"html-lsp",
			"json-lsp",
			"lua-language-server",
			"prosemd-lsp",
			"pyright",
			"rust-analyzer",
			"sqlls",
			"tailwindcss-language-server",
			"taplo",
			"terraform-ls",
			"typescript-language-server",
			"vim-language-server",
			"yaml-language-server",
			"zls",
		},
	})
end

return M
