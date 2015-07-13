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
    result = jstransform.transform(code, options)

    # NOTE: jstransform bug?
    if result.sourceMap?.sources? and not Array.isArray(result.sourceMap.sources)
      result.sourceMap.sources = [result.sourceMap.sources]

    result
