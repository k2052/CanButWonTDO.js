describe 'NewTask View', ->
	it 'should create a NewTask view', ->
		newTaskView = new NewTaskView()
		
		newTaskView.should.exist
		newTaskView.form.should.exist
