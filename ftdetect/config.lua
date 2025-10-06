vim.filetype.add {
  filename = {
    [".aliasrc"] = "zsh",
  },
  extension = { rasi = "rasi" },
  pattern = {
    [".*/waybar/config"] = "jsonc",
    [".*/mako/config"] = "dosini",
    [".*/kitty/*.conf"] = "kitty",
    [".*/hypr/.*%.conf"] = "hyprlang",
  },
}
