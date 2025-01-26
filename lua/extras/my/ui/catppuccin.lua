local colors_get = function(flavor)
  return require('catppuccin.palettes').get_palette(flavor)
end

local override_bufferline_hls = function(c)
  local hls = {
    fill = { bg = c.mantle },
    modified = { bg = c.mantle },
    pick = { bg = c.mantle },
    trunc_marker = { bg = c.mantle },
    duplicate_visible = { bg = c.base },

    buffer_visible = { fg = c.subtext0 },
    modified_visible = { fg = c.peach },
    separator = { fg = c.menlo },
    tab_selected = { fg = c.text, style = { 'bold' } },
    tab_separator = { bg = c.mantle, fg = c.mantle },
    tab_separator_selected = { bg = c.base, fg = c.base },
  }

	-- stylua: ignore start
	local items = {
		"buffer", "close_button", "diagnostic", "error", "error_diagnostic",
		"hint", "indicator", "info", "info_diagnostic", "modified",
		"numbers", "pick", "warning", "warning_diagnostic",
	}
  -- stylua: ignore end

  for _, item in ipairs(items) do
    local key_selected = item .. '_selected'
    local key_visible = item .. '_visible'

    if hls[key_selected] == nil then hls[key_selected] = {} end

    if hls[key_visible] == nil then hls[key_visible] = {} end

    hls[key_selected].bg = c.base
    hls[key_visible].bg = c.base
  end

  return hls
end

return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      highlight_overrides = {
        all = function(c)
          return {
            BufferLineCustomGroupLabel = {
              bg = c.mantle,
              fg = c.text,
              style = { 'bold' },
            },
            BufferLineCustomGroupSep = { bg = c.mantle, fg = c.maroon },
          }
        end,
      },
      integrations = {
        telescope = {
          enabled = true,
          style = 'nvchad',
        },
      },
    },
  },

  {
    'folke/tokyonight.nvim',
    enabled = false,
  },

  {
    'akinsho/bufferline.nvim',
    dependencies = { { 'catppuccin/nvim', name = 'catppuccin' } },
    optional = true,

    opts = function(_, opts)
      local catppuccin_bufferline =
        require('catppuccin.groups.integrations.bufferline')

      opts.highlights = catppuccin_bufferline.get({
        styles = { 'bold' },
        custom = {
          frappe = override_bufferline_hls(colors_get('frappe')),
          macchiato = override_bufferline_hls(colors_get('macchiato')),
          mocha = override_bufferline_hls(colors_get('mocha')),
          latte = override_bufferline_hls(colors_get('latte')),
        },
      })
    end,
  },
}
