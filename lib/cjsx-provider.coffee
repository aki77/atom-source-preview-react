react = null

module.exports =
class CjsxProvider
  fromScopeName: 'source.coffee.jsx'
  toScopeName: 'source.js'

  transform: (code, {sourceMap} = {}) ->
    react ?= require 'coffee-react'
    options =
      sourceMap: sourceMap ? false
    result = react.compile(code, options)

    unless options.sourceMap
      result = {js: result}

    {
      code: result.js
      sourceMap: result.v3SourceMap ? null
    }
