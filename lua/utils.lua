local M = {}

M.icons = {
  types = {
    Array = " ",
    Boolean = " ",
    Class = " ",
    Color = " ",
    Constant = " ",
    Constructor = " ",
    Copilot = " ",
    Enum = " ",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = " ",
    Folder = " ",
    Function = " ",
    Interface = " ",
    Key = " ",
    Keyword = " ",
    Method = " ",
    Module = " ",
    Namespace = " ",
    Null = " ",
    Number = " ",
    Object = " ",
    Operator = " ",
    Package = " ",
    Property = " ",
    Reference = " ",
    Snippet = " ",
    String = " ",
    Struct = " ",
    Text = " ",
    TypeParameter = " ",
    Unit = " ",
    Value = " ",
    Variable = " ",
  },
  diagnostics = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " ",
  },
  git = {
    added = " ",
    modified = " ",
    removed = " ",
  },
}

local function keymap(mode, lhs, rhs, opts)
  opts = opts or {}
  opts = vim.tbl_deep_extend("keep", opts, { noremap = true, })
  vim.keymap.set(mode, lhs, rhs, opts)
end

M.load_mappings = function(tbl)
  for mode, thing in pairs(tbl) do
    for item1, item2 in pairs(thing) do
      if item2[1] then
        keymap(mode, item1, item2[1], vim.tbl_deep_extend("force", item2["opts"] or {}, { noremap = true, silent = true, }))
      else
        for i1, i2 in pairs(item2) do
          if i2[1] then
            keymap(mode, item1 .. i1, i2[1], vim.tbl_deep_extend("force", i2["opts"] or {}, { noremap = true, silent = true, }))
          else
            for lhs, item in pairs(i2) do
              keymap(mode, item1 .. i1 .. lhs, item[1], vim.tbl_deep_extend("force", item["opts"] or {}, { noremap = true, silent = true, }))
            end
          end
        end
      end
    end
  end
end

M.load_options = function(options, globals)
  for key, value in pairs(options) do
    vim.opt[key] = value
  end

  for key, value in pairs(globals) do
    vim.g[key] = value
  end
end

return M
