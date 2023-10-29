return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"whoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")

		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				-- for icons:
				-- <C-v> uUNICODE
				-- <C-v> UUNICODE for longer strings
				-- <C-v>uf42e : 
				-- <C-v>Uf0792<C-c> : 󰞒
				icons = {
					--	 package_installed = , --f42e
					--	  package_pending = 󰞒, --f0792
					--	  package_uninstalled = , --f467
				},
			},
		})

		mason_lspconfig.setup({
			-- list of language servers for mason to install
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"pyright",
				"svelte",
			},

			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua", --lua formatter
				"eslint_d",
				-- "isort", --python formatter
				-- "black", -- python formatter
				-- "pylint", -- python linter
			},
		})
	end,
}
