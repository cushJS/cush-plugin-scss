syntax = require 'postcss-scss'
tokenizer = require 'postcss-scss/lib/scss-tokenize'

enabled = Symbol 'scss:enabled'

module.exports = ->
  @transform '.scss', (asset, pack) =>
    asset.ext = '.css'

    if !pack[enabled]
      pack[enabled] = true

      if config = pack.postcss
        config.syntax = syntax

      pack.tokenize = tokenizer
      return
