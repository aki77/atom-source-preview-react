path = require 'path'
fs = require 'fs'
JsxProvider = require '../lib/jsx-provider'

describe "SourcePreviewReact", ->
  [provider, jsxCode, jsCode] = []

  beforeEach ->
    atom.config.set('source-preview-react.harmony', false)
    provider = new JsxProvider
    jsxCode = fs.readFileSync(path.join(__dirname, 'fixtures', 'sample.jsx'), encoding: 'utf8')
    jsCode = fs.readFileSync(path.join(__dirname, 'fixtures', 'sample.js'), encoding: 'utf8')

  describe "transform", ->
    it "jsx to js", ->
      result = provider.transform(jsxCode)
      expect(result.code).toEqual(jsCode)
      expect(result.sourceMap).toBeNull()

    it "jsx to js with sourceMap", ->
      result = provider.transform(jsxCode, sourceMap: true)
      expect(result.code).toEqual(jsCode)
      expect(result.sourceMap).not.toBeNull()
      expect(result.sourceMap.sources).toHaveLength(1)
