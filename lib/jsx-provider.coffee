jstransform = null

module.exports =
class JsxProvider
  fromScopeName: 'source.js.jsx'
  toScopeName: 'source.js'

  defaultOptions: ->
    {
      react: true
      harmony: atom.config.get('source-preview-react.harmony')
    }

  transform: (code, {sourceMap} = {}) ->
    jstransform ?= require 'jstransform/simple'
    options = @defaultOptions()
    options.sourceMap = sourceMap if sourceMap?
    jstransform.transform(code, options)
