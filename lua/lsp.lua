local function is_list(t)
  if type(t) ~= "table" then
    return false
  end
  local n = 0
  for k in pairs(t) do
    if type(k) ~= "number" then
      return false
    end
    n = n + 1
  end
  return n > 0 and n == #t
end

-- dict 递归；数组取并集（去重，先 a 后 b）；标量 b 覆盖 a
local function merge(a, b, path, conflicts, from, to)
  if type(a) ~= "table" or type(b) ~= "table" then
    if conflicts and a ~= nil and not vim.deep_equal(a, b) then
      conflicts[#conflicts + 1] = {
        path = table.concat(path), from = from, to = to,
        before = a, after = b,
      }
    end
    return b
  end

  if is_list(a) and is_list(b) then
    local out, seen = {}, {}
    local function push(v)
      if type(v) == "string" then
        if seen[v] then return end
        seen[v] = true
      end
      out[#out + 1] = v
    end
    for _, v in ipairs(a) do push(v) end
    for _, v in ipairs(b) do push(v) end
    return out
  end

  local out = {}
  for k, v in pairs(a) do out[k] = v end
  for k, v in pairs(b) do
    out[k] = merge(a[k], v, vim.list_extend(vim.list_slice(path), { k }), conflicts, from, to)
  end
  return out
end

local M = {}

local registered = {}

--- 注册一份 capabilities。同名重复注册视为覆盖，重复 require 不会累积。
--- @param name string 来源名，便于调试与覆盖
--- @param caps table capabilities
function M.add_capabilities(name, caps)
  assert(type(name) == "string", "lsp.add(name, caps): name 必须是 string")
  assert(type(caps) == "table", "lsp.add(name, caps): caps 必须是 table")
  registered[name] = caps
end

function M.setup_capabilities()
  local merged = nil
  local conflicts = {}
  for name, caps in pairs(registered) do
    if merged == nil then
      merged = caps
    else
      merged = merge(merged, caps, {}, conflicts, nil, name)
    end
  end
  merged = merged or {}

  if #conflicts > 0 then
    local lines = { ("[lsp] capabilities 冲突 %d 处:"):format(#conflicts) }
    for _, c in ipairs(conflicts) do
      lines[#lines + 1] = ("  %s\n    %s\n --> %s:%s")
        :format(c.path, vim.inspect(c.before), c.to, vim.inspect(c.after))
    end
    vim.schedule(function() vim.notify(table.concat(lines, "\n"), vim.log.levels.WARN) end)
  end

  merged = merge(vim.lsp.protocol.make_client_capabilities(), merged, {})

  vim.lsp.config("*", {
    capabilities = merged,
  })
end

return M
