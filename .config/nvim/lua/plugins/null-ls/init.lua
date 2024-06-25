local null_ls_present, null_ls = pcall(require, "null-ls")
local lsp_format_present, lsp_format = pcall(require, "lsp-format")

if not null_ls_present or not lsp_format_present then
	vim.notify("Failed to set up null-ls and lsp-format")
	return
end

local M = {}

M.setup = function()
	local builtin = null_ls.builtins

	lsp_format.setup({})

	null_ls.setup({
		sources = {
			----------------------
			--    Diagnostics   --
			----------------------
			builtin.diagnostics.actionlint,
			builtin.diagnostics.ansiblelint,
			builtin.diagnostics.codespell,

			builtin.diagnostics.yamllint,
			builtin.diagnostics.zsh,
			require("plugins.null-ls.commitlint"),

			----------------------
			--    Formatters    --
			----------------------
			builtin.formatting.clang_format,

			-- Doesn't work for heex files
			builtin.formatting.mix.with({
				extra_filetypes = { "eelixir", "heex" },
				args = { "format", "-" },
				extra_args = function(_params)
					local version_output = vim.fn.system("elixir -v")
					local minor_version = vim.fn.matchlist(version_output, "Elixir \\d.\\(\\d\\+\\)")[2]

					local extra_args = {}

					-- tells the formatter the filename for the code passed to it via stdin.
					-- This allows formatting heex files correctly. Only available for
					-- Elixir >= 1.14
					if tonumber(minor_version, 10) >= 14 then
						extra_args = { "--stdin-filename", "$FILENAME" }
					end

					return extra_args
				end,
			}),
			builtin.formatting.pg_format,
			builtin.formatting.prettierd.with({
				extra_filetypes = { "ruby" },
				disabled_filetypes = { "markdown" },
			}),
			builtin.formatting.prettier.with({
				filetypes = { "markdown" },
			}),
			builtin.formatting.shfmt,
			builtin.formatting.stylua,
		},
		on_attach = function(client)
			if client.supports_method("textDocument/formatting") then
				lsp_format.on_attach(client)
			end
		end,
	})
end

return M
