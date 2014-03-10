describe 'Task View', ->
	it 'should create a Task view', ->
		task = Task.create()
		taskView = new TaskView(task, new StatBar())
		taskView.should.exist
		taskView.icon.should.exist

	it 'should set icon class', ->
		task = Task.create()
		taskView = new TaskView(task, new StatBar())

		taskView.icon.should.not.have.class('failed')

		task.set 'failed', true
		taskView.icon.should.have.class('failed')
