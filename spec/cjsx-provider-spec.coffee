path = require 'path'
fs = require 'fs'
CjsxProvider = require '../lib/cjsx-provider'

describe "SourcePreviewReact", ->
  [provider, cjsxCode, jsCode] = []

  beforeEach ->
    provider = new CjsxProvider
    cjsxCode = fs.readFileSync(path.join(__dirname, 'fixtures', 'car.cjsx'), encoding: 'utf8')
    jsCode = fs.readFileSync(path.join(__dirname, 'fixtures', 'car.js'), encoding: 'utf8')

  describe "transform", ->
    it "cjsx to js", ->
      {code, sourceMap} = provider.transform(cjsxCode)
      expect(code).toEqual(jsCode)
      expect(sourceMap).toBeNull()

    it "jsx to js with sourceMap", ->
      {code, sourceMap} = provider.transform(cjsxCode, sourceMap: true)
      expect(code).toEqual(jsCode)
      expect(sourceMap).not.toBeNull()
      expect(JSON.parse(sourceMap).sources).toHaveLength(1)
