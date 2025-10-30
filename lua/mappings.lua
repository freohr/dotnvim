local utils = require "utils"
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs
    -- ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
    -- ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
    ["<A-]>"] = {
      function() require("astrocore.buffer").nav(vim.v.count1) end,
      desc = "Next buffer",
    },
    ["<A-[>"] = {
      function() require("astrocore.buffer").nav(-vim.v.count1) end,
      desc = "Previous buffer",
    },
    -- mappings seen under group name "Buffer"
    ["<Leader>bd"] = {
      function()
        require("astroui.status.heirline").buffer_picker(function(bufnr) require("astrocore.buffer").close(bufnr) end)
      end,
      desc = "Close buffer from tabline",
    },
    -- Quick insert shebangs
    ["<leader>#"] = { name = "Shebangs" },
    ["<leader>#b"] = { "gg^i#!/bin/bash<Esc>``", desc = "bash" },
    ["<leader>#z"] = { "gg^i#!/bin/zsh<Esc>``", desc = "zsh" },
    ["<leader>#p"] = { "gg^i#!/bin/python<Esc>``", desc = "system python" },
    ["<leader>#P"] = { "gg^i#!python<Esc>``", desc = "venv python" },
    -- Select all
    ["yA"] = { "gg^yG``", desc = "Copy entire file content" },
    ["dA"] = { "gg^dG", desc = "Delete entire file content" },

    -- Vimtex
    ["<leader>lt"] = { function() return require("vimtex.snacks").toc() end, desc = "LaTeX ToC Picker" },
  },
  v = {
    ["<leader>c"] = {
      function()
        local newfile_path = vim.fn.expand "%:.:h" .. "/" .. utils.buf_vtext()
        vim.cmd(":e " .. newfile_path)
      end,
      desc = "Create or open file from selection relative to current buffer",
    },
    ["A"] = {
      "<Esc>gg^vG$",
      desc = "Select All",
    },
    ["H"] = {
      function() local escaped_text = utils.buf_vtext() end,
      desc = "Replace selected text",
    },
  },
  i = {},
  t = {},
}
