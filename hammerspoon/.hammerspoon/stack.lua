-- Stack table

Stack = {}

function Stack:create()

	local t = {}
	t._et = {}

	function t:push(...)
		if ... then
			local targs = {...}

			for _,v in ipairs(targs) do
				table.insert(self._et, v)
			end
		end
	end

	function t:pop()