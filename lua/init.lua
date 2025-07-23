local M = {}

function M.setup(opts)
	opts = opts or {}
	if opts.lang then
		lang = opts.lang
	else
		lang = "en_us"
	end
	vim.api.nvim_create_user_command("Prose", M.prose, {})
end

prosed = false

function M.prose()
	if not prosed then
		vim.opt_local.spell = true
		vim.opt_local.spelllang = lang
		vim.opt_local.wrap = true

		vim.keymap.set({ "n", "v" }, "j", "gj")
		vim.keymap.set({ "n", "v" }, "k", "gk")
		vim.keymap.set({ "n", "v" }, "0", "g0")
		vim.keymap.set({ "n", "v" }, "$", "g$")
		vim.keymap.set({ "n", "v" }, "^", "g^")

		prosed = true
		vim.notify("prose mode: enabled")
	else
		vim.opt_local.spell = false
		vim.opt_local.spelllang = nil
		vim.opt_local.wrap = false
		vim.keymap.del({ "n", "v" }, "j")
		vim.keymap.del({ "n", "v" }, "k")
		vim.keymap.del({ "n", "v" }, "0")
		vim.keymap.del({ "n", "v" }, "$")
		vim.keymap.del({ "n", "v" }, "^")
		prosed = false
		vim.notify("prose mode: disabled")
	end
end

return M
