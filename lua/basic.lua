local set = vim.opt

-- utf8
set.encoding = "UTF-8"
set.fileencoding = "UTF-8"
set.fileencodings= "utf8,cp936,gb18030,big5"

if vim.g.neovide then
  -- 设置字体
  if vim.fn.has("win64") ~= 0 then
    set.guifont = {
      "IosevkaSlab Nerd Font",
      "Source Han Sans SC",
      ":h10"
    }
  else
    set.guifont = {
      "IosevkaSlab Nerd Font",
      "Source Han Sans CN",
      ":h9"
    }
  end

  -- 自动隐藏光标
  vim.g.neovide_hide_mouse_when_typing = true
end

-- jk移动时光标下上方保留8行
set.scrolloff = 8
set.sidescrolloff = 8

-- 使用相对号
set.number = true
set.relativenumber = true

-- 高亮所在行
set.cursorline = true

-- 显示左侧图标指示列
set.signcolumn = 'yes'

-- 右侧参考线，超过表示代码太长了，考虑换行
set.colorcolumn = '81'

-- 缩进2个空格等于一个Tab
set.tabstop = 2
set.softtabstop = 2
set.shiftround = true

-- >> << 时移动长度
set.shiftwidth = 2

-- 新行对齐当前行，空格替代tab
set.expandtab = true
set.autoindent = true
set.smartindent = true

-- 搜索大小写敏感
set.ignorecase = false
set.smartcase = true

-- 搜索高亮
set.hlsearch = true

-- 边输入边搜索
set.incsearch = true

-- 使用增强状态栏后依然需要 vim 的模式提示
set.showmode = false

-- 命令行高为1
set.cmdheight = 1

-- 当文件被外部程序修改时，自动加载
set.autoread = true

-- 折行
set.wrap = false

-- 行结尾可以跳到下一行
set.whichwrap = '<,>,[,],h,l'

-- 允许隐藏被修改过的buffer
set.hidden = true

-- 鼠标支持
set.mouse = "a"

-- 禁止创建备份文件
set.backup = false
set.writebackup = false
set.swapfile = false

-- smaller updatetime
set.updatetime = 300

-- 等待mappings
set.timeoutlen = 100

-- split window 从下边和右边出现
set.splitbelow = true
set.splitright = true

-- 自动补全不自动选中
set.completeopt = "menu,menuone,noselect,noinsert"

-- 样式
set.background = "dark"
set.termguicolors = true

-- 不可见字符的显示，这里只把空格显示为一个点
set.list = true
set.listchars = "trail:·"

-- 补全增强
set.wildmenu = true

-- Dont' pass messages to |ins-completin menu|
set.shortmess = vim.o.shortmess .. 'c'
set.pumheight = 10

-- always show tabline
set.showtabline = 1
