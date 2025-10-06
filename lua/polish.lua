-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "reenable Semshi on python file save",
  group = vim.api.nvim_create_augroup("semshi", { clear = true }),
  callback = function(opts)
    if vim.bo[opts.buf].filetype == "python" then vim.cmd "Semshi enable" end
  end,
})

return
