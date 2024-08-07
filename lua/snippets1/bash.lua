local ls = require('luasnip')

ls.add_snippets('sh', {
  ls.snippet('she', {
    ls.text_node('#!/usr/bin/env zsh'),
  }),
})
