local M = {}

M.logger = {
	enabled = false,
	_log_path = '/tmp/nvimdebug.log',
	_this_is_a_log_table = true,
	write = function(self, ...)
		if not self.enabled then
			return
		end
		if not self._this_is_a_log_table then
			error('Please call `log:write` with a semicolon')
		end
		if not self._fh then
			self._fh = io.open(self._log_path, 'a')
		end
		local buf = {}
		for i = 1, select('#', ...) do
			local v = select(i, ...)
			table.insert(buf, vim.inspect(v))
		end
		self._fh:write(
			os.date('%Y:%m:%d %H.%M.%S')
			.. ' '
			.. self.get_debug_stack(3)
			.. '\n'
			.. table.concat(buf, '\n')
			.. '\n'
		)
		self._fh:flush()
	end,
	get_debug_stack = function (depth)
		local n = debug.getinfo(depth, 'Sn')
		if n['name'] == nil then
			n['name'] = 'Unknown function'
		end
		if n['source'] == nil then
			n['source'] = '@Unknown file'
		end
		return n.source:sub(2) .. ':' .. n.name
	end
}

function M.install(use, plugins)
	for _, plugin in pairs(plugins) do
		M.logger:write('Installing', plugin)
		if type(plugin) == "string" then
			use { plugin }
		else
			local last = function(opts)
			end
			local opts = {}
			if plugin['last'] ~= nil then
				last = plugin['last']
				plugin['last'] = nil
				opts = plugin['opt']
				plugin['opt'] = nil
			end
			use (plugin)
			last(opts)
		end
	end
end

function M.has_val(t, val)
	for k,v in pairs(t) do if k == val then return true end end return false
end

return M
