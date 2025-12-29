local telescope = require('telescope')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local previewers = require('telescope.previewers')
local putils = require('telescope.previewers.utils')

-- Custom action to open all selected files in tabs
local function open_multiple_in_tabs(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local multi_selection = picker:get_multi_selection()

  -- If there are selected items, open them all in tabs
  if #multi_selection > 0 then
    actions.close(prompt_bufnr)
    for _, entry in ipairs(multi_selection) do
      vim.cmd('tabedit ' .. entry.path or entry.filename or entry.value)
    end
  else
    -- If nothing selected, open current item in tab
    actions.select_tab(prompt_bufnr)
  end
end

-- Custom previewer that handles images with chafa
local image_extensions = { 'png', 'jpg', 'jpeg', 'gif', 'webp', 'svg' }

local function is_image(filepath)
  local ext = filepath:match("^.+%.(.+)$")
  if not ext then return false end
  ext = ext:lower()
  for _, image_ext in ipairs(image_extensions) do
    if ext == image_ext then
      return true
    end
  end
  return false
end

local custom_previewer = previewers.new_termopen_previewer({
  get_command = function(entry)
    local path = entry.path or entry.filename or entry.value
    if path and is_image(path) then
      return {
        'chafa',
        '--format=symbols',
        '--symbols=block+border+space-wide+extra',
        '--colors=truecolor',
        '--dither=ordered',
        '--animate=off',
        '--center=on',
        path
      }
    else
      -- Fall back to bat for text files
      return { 'bat', path }
    end
  end
})

telescope.setup({
  defaults = {
    file_previewer = function() return custom_previewer end,
    mappings = {
      i = {
        -- Send selected to quickfix list
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        -- Open selected in tabs
        ["<C-t>"] = open_multiple_in_tabs,
        -- Toggle selection and move to next
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        -- Open multiple selected files (or current if none selected)
        ["<CR>"] = actions.select_default,
      },
      n = {
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<C-t>"] = open_multiple_in_tabs,
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<CR>"] = actions.select_default,
      },
    },
  },
  extensions = {
    file_browser = {
      hijack_netrw = false,
    },
    media_files = {
      filetypes = {"png", "jpg", "jpeg", "gif", "webp", "svg"},
      find_cmd = "rg"
    },
  },
})

-- Load extensions
telescope.load_extension('file_browser')
telescope.load_extension('media_files')
