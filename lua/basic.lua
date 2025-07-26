local opt = vim.opt

-- utf8
opt.encoding = "UTF-8"
opt.fileencoding = "UTF-8"
opt.fileencodings= "utf8,cp936,gb18030,big5"

if vim.g.neovide then
  -- 设置字体
  if vim.fn.has("win64") ~= 0 then
    opt.guifont = {
      "IosevkaSlab Nerd Font",
      "Source Han Sans SC",
      ":h10"
    }
  else
    opt.guifont = {
      "IosevkaSlab Nerd Font",
      "Source Han Sans CN",
      ":h9"
    }
  end

  -- 自动隐藏光标
  vim.g.neovide_hide_mouse_when_typing = true
end

-- jk移动时光标下上方保留8行
opt.scrolloff = 8
opt.sidescrolloff = 8

-- 使用相对号
opt.number = true
opt.relativenumber = true

-- 高亮所在行
opt.cursorline = true

-- 显示左侧图标指示列
opt.signcolumn = 'yes'

-- 右侧参考线，超过表示代码太长了，考虑换行
opt.colorcolumn = '81'

-- 缩进2个空格等于一个Tab
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftround = true

-- >> << 时移动长度
opt.shiftwidth = 2

-- 新行对齐当前行，空格替代tab
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- 搜索大小写敏感
opt.ignorecase = false
opt.smartcase = true

-- 搜索高亮
opt.hlsearch = true

-- 边输入边搜索
opt.incsearch = true

-- 使用增强状态栏后依然需要 vim 的模式提示
opt.showmode = false

-- 命令行高为1
opt.cmdheight = 1

-- 当文件被外部程序修改时，自动加载
opt.autoread = true

-- 折行
opt.wrap = false

-- 行结尾可以跳到下一行
opt.whichwrap = '<,>,[,],h,l'

-- 允许隐藏被修改过的buffer
opt.hidden = true

-- 鼠标支持
opt.mouse = "a"

-- 禁止创建备份文件
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- smaller updatetime
opt.updatetime = 300

-- 等待mappings
opt.timeoutlen = 100

-- split window 从下边和右边出现
opt.splitbelow = true
opt.splitright = true

-- 自动补全不自动选中
opt.completeopt = "menu,menuone,noselect,noinsert"

-- 样式
opt.background = "dark"
opt.termguicolors = true

-- 不可见字符的显示，这里只把空格显示为一个点
opt.list = true
opt.listchars = "trail:·"

-- 补全增强
opt.wildmenu = true

-- Dont' pass messages to |ins-completin menu|
opt.shortmess = vim.o.shortmess .. 'c'
opt.pumheight = 10

-- always show tabline
opt.showtabline = 1
