local ls = require('luasnip')

ls.add_snippets('sql', {
  ls.snippet('cu', {
    ls.text_node({
      'created_at TIMESTAMP NOT NULL,',
      'updated_at TIMESTAMP NOT NULL,',
    }),
  }),
  ls.snippet('nn', {
    ls.text_node({
      'NOT NULL',
    }),
  }),
})
