local status_ok, telescope = pcall(require, "telescope")
if status_ok then
  local actions = require "telescope.actions"
  local fb_actions = require("telescope").extensions.file_browser.actions
  -- local fb_picker = require("telescope").extensions.file_browser.picker
  -- local hop = telescope.extensions.hop
  return {
    defaults = {
      selection_caret = "  ",
      layout_config = {
        width = 0.90,
        height = 0.85,
        preview_cutoff = 120,
        horizontal = {
          preview_width = 0.6,
        },
        vertical = {
          width = 0.50,
          height = 0.95,
          preview_height = 0.5,
        },
        flex = {
          horizontal = {
            preview_width = 0.9,
          },
        },
      },
      mappings = {
        i = {
          -- ["<C-h>"] = hop.hop,
          -- ["<C-space>"] = function(prompt_bufnr)
          --   local opts = {
          --     callback = actions.toggle_selection,
          --     loop_callback = actions.send_selected_to_qflist,
          --   }
          --   hop._hop_loop(prompt_bufnr, opts)
          -- end,
        },
      },
    },
    extensions = {
      file_browser = {
        mappings = {
          i = {
            ["<C-h>"] = fb_actions.toggle_hidden,
            ["<C-a>"] = fb_actions.create,
            ["<C-r>"] = fb_actions.rename,
            ["<C-y>"] = fb_actions.copy,
            ["<C-d>"] = fb_actions.move,
            ["<C-x>"] = fb_actions.remove,
          },

          n = {
            ["<C-h>"] = fb_actions.toggle_hidden,
            ["<C-a>"] = fb_actions.create,
            ["<C-r>"] = fb_actions.rename,
            ["<C-y>"] = fb_actions.copy,
            ["<C-d>"] = fb_actions.move,
            ["<C-x>"] = fb_actions.remove,
          },
        },
      },
      -- bibtex = {
      --   context = true,
      --   context_fallback = false,
      -- },
      -- media_files = {
      --   filetypes = { "png", "jpg", "mp4", "webm", "pdf" },
      --   find_cmd = "rg",
      -- },
    },
  }
else
  return {}
end
