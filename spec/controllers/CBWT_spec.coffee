CBWT = require('../lib/CBWT')

describe 'CBWT', ->
	it 'should create an instance', ->
		app = new CBWT()
		app.should.be.an.instanceOf CBWT
		app.version.should.equal '0.0.1'
