-- luasnip
local ls = require('luasnip')
local extras = require('luasnip.extras')
local fmt = require('luasnip.extras.fmt').fmt

-- lib
local get_filename_without_ext =
  require('snippets1.lib.get_filename_without_ext')

local get_storybook_folder = function()
  local path = vim.fn.expand('%:p') -- Get the full path of the current file
  local folders = { 'pages', 'widgets', 'features', 'entities', 'shared' }

  for _, folder in ipairs(folders) do
    if string.match(path, '/' .. folder .. '/') then return folder end
  end

  return 'shared' -- or any default value you want
end

local storybookTemplate = ls.snippet(
  'sts',
  fmt(
    [[
        import type {{ Meta, StoryObj }} from '@storybook/react'
        import {{ {fileName} }} from "./{fileName}";

        export default {{
          title: "{folder}/{fileName}",
          component: {fileName},
          argTypes: {{
            backgroundColor: {{ control: "color" }},
          }},
          args: {{{}}}
        }} as Meta<typeof {fileName}>;

        type Story = StoryObj<typeof {fileName}>

        export const Primary: Story = {{{}}}
        ]],
    {
      folder = ls.function_node(get_storybook_folder),
      fileName = ls.function_node(get_filename_without_ext),
      ls.insert_node(1),
      ls.insert_node(2),
    }
  )
)

local createOneStory = ls.snippet(
  'st',
  fmt(
    [[
        export const {}: Story = {{}};
        ]],
    {
      ls.insert_node(1, 'StoryName'), -- Placeholder for story name
    }
  )
)

ls.add_snippets('typescriptreact', {
  storybookTemplate,
  createOneStory,
})
