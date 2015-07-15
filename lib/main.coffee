JsxProvider = require './jsx-provider'
CjsxProvider = require './cjsx-provider'

module.exports =

  config:
    jsxHarmony:
      order: 1
      type: 'boolean'
      description: 'shortcut to enable ES6 & ES7 transforms'
      default: false

  activate: ->
    @jsxProvider = new JsxProvider
    @cjsxProvider = new CjsxProvider

  deactivate: ->
    @jsxProvider = null
    @cjsxProvider = null

  provide: ->
    [@jsxProvider, @cjsxProvider]
