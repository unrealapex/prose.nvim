if vim.fn.has("spell") ~= 1 then
	-- vim.api.nvim_err_writeln("prose.nvim requires +spell")
	print("prose.nvim requires +spell")
end
