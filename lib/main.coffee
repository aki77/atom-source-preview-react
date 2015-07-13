JsxProvider = require './jsx-provider'

module.exports =

  config:
    harmony:
      order: 1
      type: 'boolean'
      description: 'shortcut to enable ES6 & ES7 transforms'
      default: false

  activate: ->
    @jsxProvider = new JsxProvider

  deactivate: ->
    @jsxProvider = null

  provide: ->
    @jsxProvider
