-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

vim.api.nvim_create_autocmd('BufWritePost',
{
  desc = "reenable Semshi on python file save",
  group = vim.api.nvim_create_augroup("semshi", {clear = true}),
  callback = function(opts)
    if vim.bo[opts.buf].filetype == "python" then
      vim.cmd "Semshi enable"
    end
  end
})
