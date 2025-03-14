local colors = {
  white     = "#e6edf3",
  silver    = "#8b949e",
  lightgray = "#262c36",
  gray      = "#171b22",
  darkgray  = "#0d1117",
  black     = "#010409",
  red       = "#ff7b72",
  lime      = "#7ee787",
  blue      = "#79c0ff",
  purple    = "#d2a8ff",
  skyblue   = "#a5d6ff",
  yellow    = "#e3b341",
  orange    = "#ffa657",
}

local highlight_groups = {
  NonText                 = { fg = colors.gray },
  Normal                  = { fg = colors.white, bg = colors.darkgray },
  LineNr                  = { fg = colors.silver },
  CursorLine              = { bg = colors.gray },
  CursorLineNr            = { fg = colors.white },
  Visual                  = { bg = colors.lightgray },

  FloatBorder             = { fg = colors.silver },

  SignColumn              = {},
  ColorColumn             = { bg = colors.gray },

  Pmenu                   = { bg = colors.gray },

  -- 消息
  MsgArea                 = { bg = colors.black },
  ErrorMsg                = { fg = colors.red },
  WarningMsg              = { fg = colors.yellow },
  DiagnosticError         = "ErrorMsg",
  DiagnosticWarn          = "WarningMsg",
  DiagnosticInfo          = { fg = colors.white },
  DiagnosticHint          = { fg = colors.skyblue },
  DiagnosticOK            = { fg = colors.lime },

  --
  Special                 = { bold = true },
  Url                     = { fg = colors.blue, underline = true },
  ["@text.uri"          ] = "Url",
  ["@text.reference"    ] = { fg = colors.blue, underline = true, },
  -- ["@text.literal"      ] = { bg = colors.gray },

  TabLine                 = { fg = colors.silver, bg = colors.gray },
  TabLineFill             = { bg = colors.black },

  Folded                  = { fg = colors.silver, bg = colors.gray },

  -- Treesitter
  ["@comment"           ] = { fg = colors.silver },
  ["@keyword"           ] = { fg = colors.red },
  ["@repeat"            ] = "@keyword",
  ["@conditional"       ] = "@keyword",
  ["@type.qualifier"    ] = "@keyword",
  ["@include"           ] = "@keyword",
  ["@builtin"           ] = "@keyword",
  ["@parameter"         ] = { bold = true },
  ["@function"          ] = { fg = colors.purple },
  ["@Function.builtin"  ] = {},
  ["@method"            ] = "@function",
  ["@macro"             ] = { fg = colors.purple, bold = true },
  ["@variable"          ] = { italic = true },
  ["@variable.builtin"  ] = {},
  ["@variable.parameter"] = {},
  ["@property"          ] = { "@variable", fg = colors.blue },
  ["@type"              ] = { fg = colors.orange },
  ["@type.builtin"      ] = {},
  ["@constructor"       ] = "@type",
  ["@constant"          ] = { fg = colors.blue, bold = true },
  ["@constant.builtin"  ] = { fg = colors.blue, bold = true },
  ["@boolean"           ] = { fg = colors.blue },
  ["@number"            ] = { fg = colors.blue },
  ["@number.float"      ] = "@number",
  ["@string"            ] = { fg = colors.skyblue },
  ["@string.escape"     ] = { fg = colors.red },
  ["@character"         ] = "@string",
  ["@operator"          ] = { fg = colors.red },
  Identifier              = "Normal",
  Comment                 = "@comment",
  Repeat                  = "@repeat",
  Statement               = { fg = colors.red },
  Conditional             = "@conditional",
  Function                = "@function",
  Parameter               = "@parameter",
  Type                    = "@type",
  Constant                = "@constant",
  String                  = "@string",
  Character               = "@character",
  Boolean                 = "@boolean",
  Number                  = "@number",
  Float                   = "@number.float",
  PreProc                 = { fg = colors.red },
  Macro                   = "@macro",
  ["@lsp.type.macro"    ] = { link = "@lsp" },
  ["@lsp.type.type"    ] = { link = "@lsp" },
  ["@lsp.type.class"    ] = { link = "@lsp" },
  ["@delimiter"]          = { fg = colors.white },
  ["@tag"               ] = { fg = colors.lime },
  ["@tag.attribute"     ] = { fg = colors.blue },
  ["@tag.delimiter"     ] = "@delimiter",
  Tag                     = "@tag",
  Delimiter               = "@delimiter",

  -- mark language specific
  -- xml
  xmlTagName              = "@tag",
  xmlTag                  = "@tag.delimiter",
  xmlEndTag               = "xmlTag",
  xmlAttrib               = "@tag.attribute",
  xmlEqual                = {},
  -- html
  htmlTagName             = "xmlTagName",
  htmlTagN                = "htmlTagName",
  htmlTag                 = "xmlTag",
  htmlEndTag              = "xmlEndTag",
  htmlArg                 = "xmlAttrib",
  htmlEqual               = "xmlEqual",
}

local function parse_group(group_name)
  local group_opts = highlight_groups[group_name]
  local dep_groups = {}
  local result = {}

  if string.match(group_name, "^@.+$") then -- 针对‘@’开头的高亮组
    result.nocombine = true

    if group_opts == nil then
      group_opts = {}
    end
  end

  if type(group_opts) == "string" then
    result = parse_group(group_opts)
  else
    -- 整理依赖项
    if string.match(group_name, "^@.+%.[^.]+$") then -- 针对‘@’开头用‘.’分隔的高亮组
      table.insert(dep_groups, "@" .. string.match(group_name, "^@(.+)%.[^.]+$"))
      table.insert(dep_groups, "@" .. string.match(group_name, "^@.+%.([^.]+)$"))
    end

    for _, dep_group_name in ipairs(group_opts) do
      if type(dep_group_name) == "string" then
        table.insert(dep_groups, dep_group_name)
      end
    end

    -- 处理依赖项
    for _, dep_group_name in ipairs(dep_groups) do
      for dep_opt_name, dep_opt_val in pairs(parse_group(dep_group_name)) do
        result[dep_opt_name] = dep_opt_val
      end
    end

    -- 处理自身选项
    for opt_name, opt_val in pairs(group_opts) do
      if opt_name == "link" then
        result = { link = opt_val }
        break
      end
      if type(opt_name) ~= "number" then
        result[opt_name] = opt_val
      end
    end
  end

  return result
end

for group_name, _ in pairs(highlight_groups) do
  local set_hl_opts = parse_group(group_name)

  if next(set_hl_opts) == nil then
    vim.api.nvim_set_hl(0, group_name, { link = "Normal" })
    vim.api.nvim_set_hl(0, group_name, {})
  else
    vim.api.nvim_set_hl(0, group_name, set_hl_opts)
  end
end
