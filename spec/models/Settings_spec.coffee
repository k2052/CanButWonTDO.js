Settings = require('../lib/models/Settings')

describe 'Settings', ->
	it 'should create and destroy Settings', ->
		settings = Settings.create()
		settings.should.be.an.instanceOf Settings

		settings.id.should.not.be.null

		id = settings.id
		settings.destroy().should.be.true

		settings = Settings.find(id)
		settings.should.be.null
