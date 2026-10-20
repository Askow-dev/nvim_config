local present, telescope = pcall(require, "telescope")
if not present then
	return
end

telescope.setup {
	pickers = {
		find_files = {
			hidden = true, --will still show the inside of `.git/` as it's not `.gitignore`d.
			--find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "!**/__pycache__/*" },
		},
	},
	defaults = {
		file_ignore_patterns = {
			"__pycache__/", "^.git/"
		},
	},
	--extensions = {
	--	media_files = {
	--		filetypes = { "png", "webp", "jpg", "jpeg" },
	--		find_cmd = "rg"
	--	},
	--	fzf = {
	--		fuzzy = true,
	--		override_generic_sorter = true,
	--		override_file_sorter = true,
	--		case_mode = "smart_case",
	--	},
	--},
}
telescope.load_extension("fzf")
