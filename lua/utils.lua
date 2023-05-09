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
  for mode, item in pairs(tbl) do
    for item1, item2 in pairs(item) do
      if item2[1] then
        keymap(mode, item1, item2[1], vim.tbl_deep_extend("force", item2["opts"] or {}, { noremap = true, silent = true, }))
      else
        for lhs, i in pairs(item2) do
          keymap(mode, item1 .. lhs, i[1], vim.tbl_deep_extend("force", i["opts"] or {}, { noremap = true, silent = true, }))
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
