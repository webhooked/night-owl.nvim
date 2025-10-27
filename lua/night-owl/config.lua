local M = {}

---@class Config
local default_options = {
	background = "dark", -- "dark", "light" or "auto"
	bold = true,
	italics = true,
	underline = true,
	undercurl = true,
	transparent = false,
}

---@type Config
M.options = default_options

local function set_default_settings(options)
	-- For legacy vim support (TODO: need to confirm)
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.cmd("highlight clear")

	-- Determine background
	local bg = options.background
	if bg == "auto" then
		bg = vim.o.background
	end
	
	vim.opt.background = bg
	vim.g.colors_name = "night-owl"
	vim.opt.termguicolors = true
end

---@param options Config|nil
local function handle_user_options(options)
	return vim.tbl_deep_extend("force", {}, default_options, options or {})
end

---@param options Config|nil
local function handle_extended_options(options)
	return vim.tbl_deep_extend("force", {}, M.options or default_options, options or {})
end

---@param options Config|nil
function M.extend(options)
	M.options = handle_extended_options(options)
end

---@param options Config|nil
function M.setup(options)
	M.options = handle_user_options(options)
	set_default_settings(M.options)
end

return M
