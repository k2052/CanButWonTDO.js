Task = require('../lib/models/Task')

describe 'Task', ->
	it 'should create and destroy Task', ->
		task = Task.create name: 'Test Task', body: 'test task body'
		task.should.be.an.instanceOf Task

		task.id.should.not.be.null

		id = task.id
		task.destroy().should.be.true

		task = Task.find(id)
		task.should.be.null

	it 'should fail to create task if invalid', ->
		expect(->
			task = Task.create()
		).to.throw(Error, "Body Required")

	it 'should return isValid', ->
		task = new Task name: 'Test Task', body: 'test task body'

		task.isValid().should.be.true
