-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "reenable Semshi on python file save",
  group = vim.api.nvim_create_augroup("semshi", { clear = true }),
  callback = function(opts)
    if vim.bo[opts.buf].filetype == "python" then vim.cmd "Semshi enable" end
  end,
})

return

-- vim.filetype.add {
--   filename = {
--     [".aliasrc"] = "zsh",
--   },
--   extension = { rasi = "rasi" },
--   pattern = {
--     [".*/waybar/config"] = "jsonc",
--     [".*/mako/config"] = "dosini",
--     [".*/kitty/*.conf"] = "bash",
--     [".*/hypr/.*%.conf"] = "hyprlang",
--   },
-- }
