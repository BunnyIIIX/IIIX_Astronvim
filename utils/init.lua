local M = {}

function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = M.merge(options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- function M.map(mode, lhs, rhs, opts)
--   local options = { noremap = true, silent = true }
--   if opts then
--     options = M.merge(options, opts)
--   end
--   vim.api.nvim_set_keymap(mode, lhs, rhs, options)
-- end

-- function M.buf_map(bufnr, mode, lhs, rhs, opts)
-- 	local options = { noremap = true, silent = true }
-- 	if opts then
-- 		options = M.merge(options, opts)
-- 	end
-- 	vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, options)
-- end

function M.merge(...)
  return vim.tbl_deep_extend("force", ...)
end

function M.split(str, sep)
  local res = {}
  for w in str:gmatch("([^" .. sep .. "]*)") do
    if w ~= "" then
      table.insert(res, w)
    end
  end
  return res
end

function M.get_active_lsp_client_names()
  local active_clients = vim.lsp.get_active_clients()
  local client_names = {}
  for _, client in pairs(active_clients or {}) do
    local buf = vim.api.nvim_get_current_buf()
    -- only return attached buffers
    if vim.lsp.buf_is_attached(buf, client.id) then
      table.insert(client_names, client.name)
    end
  end

  if not vim.tbl_isempty(client_names) then
    table.sort(client_names)
  end
  return client_names
end

local function unload(module_pattern, reload)
  reload = reload or false
  for module, _ in pairs(package.loaded) do
    if module:match(module_pattern) then
      package.loaded[module] = nil
      if reload then
        require(module)
      end
    end
  end
end

local function clear_cache()
  if 0 == vim.fn.delete(vim.fn.stdpath "config" .. "/lua/packer_compiled.lua") then
    vim.cmd ":LuaCacheClear"
  end
end

function M.post_reload(msg)
  local Logger = require "user.utils.logger"
  unload("user", true)
  unload("user.utils", true)
  unload("user.plugins", true)
  unload("user.custom.mappings", true)
  -- unload("user.theme.rose-pine", true)
  -- unload("user.theme.sacr3d-moon", true)
  msg = msg or "User config reloaded!"
  Logger:log(msg)
end

function M.reload_user_config_sync()
  M.reload_user_config()
  clear_cache()
  unload("user", true)
  unload("user.utils", true)
  unload("user.plugins", true)
  unload("user.custom.mappings", true)
  -- unload("user.theme.sacr3d-moon", true)
  -- unload("user.theme.rose-pine", true)
  vim.cmd [[autocmd User PackerCompileDone ++once lua require('user.utils').post_reload()]]
  vim.cmd ":PackerSync"
end

function M.reload_user_config(compile)
  compile = compile or false
  unload("user", true)
  unload("user.utils", true)
  unload("user.plugins", true)
  unload("user.custom.mappings", true)
  -- unload("user.theme.sacr3d-moon", true)
  -- unload("user.theme.rose-pine", true)
  if compile then
    vim.cmd [[autocmd User PackerCompileDone ++once lua require('user.utils').post_reload()]]
    vim.cmd ":PackerCompile"
  end
end

function M.ReloadConfig()
  local hls_status = vim.v.hlsearch
  for name, _ in pairs(package.loaded) do
    if name:match "^cnull" then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
  if hls_status == 0 then
    vim.opt.hlsearch = false
  end
end

-- function M.get_install_dir()
--   local config_dir = os.getenv "SACR3DNVIM_INSTALL_DIR"
--   if not config_dir then
--     return vim.fn.stdpath "config"
--   end
--   return config_dir
-- end

-- update instance of Sacr3dNvim
-- function M.update()
--   local Logger = require "user.utils.logger"
--   local Job = require "plenary.job"
--   local path = M.get_install_dir()
--   local errors = {}
--
--   Job
--     :new({
--       command = "git",
--       args = { "pull", "--ff-only" },
--       cwd = path,
--       on_start = function()
--         Logger:log "Updating..."
--       end,
--       on_exit = function()
--         if vim.tbl_isempty(errors) then
--           Logger:log "Updated! Running Sacr3dReloadSync..."
--           M.reload_user_config_sync()
--         else
--           table.insert(errors, 1, "Something went wrong! Please pull changes manually.")
--           table.insert(errors, 2, "")
--           Logger:error("Update failed!", { timeout = 30000 })
--         end
--       end,
--       on_stderr = function(_, err)
--         table.insert(errors, err)
--       end,
--     })
--     :sync()
-- end

return M
