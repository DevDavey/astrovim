-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)
-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end
-- Check if the operating system is Windows
if vim.fn.has "win32" == 1 then
  -- Set the shell to Git Bash
  vim.cmd [[let &shell='"C:\Program Files\Git\bin\bash.exe"']]
  vim.cmd [[set shellcmdflag='-c']]
  vim.cmd [[set shellxquote=]]
  vim.cmd [[set shellxescape=]]
end

function my_paste(reg)
  return function(lines)
    local content = vim.fn.getreg '"'
    return vim.split(content, "\n")
  end
end

if os.getenv "SSH_TTY" == nil then
  vim.o.clipboard = "unnamedplus"
else
  vim.o.clipboard = "unnamedplus"
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy "+",
      ["*"] = require("vim.ui.clipboard.osc52").copy "*",
    },
    paste = {
      ["+"] = my_paste "+",
      ["*"] = my_paste "*",
    },
  }
end

require "lazy_setup"
require "polish"
