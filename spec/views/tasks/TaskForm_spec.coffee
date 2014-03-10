describe 'TaskForm View', ->
	it 'should create a TaskForm view', ->
		task = Task.create()
		taskView = new TaskView(task, new StatBar())

		taskFormView = new TaskForm()
		taskFormView.should.exist
		taskFormView.form.should.exist
		taskFormView.form.attr('method').should.equal 'POST'

	it 'should create a TaskForm view', ->
		task = Task.create()
		taskView = new TaskView(task, new StatBar())

		taskFormView = new TaskForm()
		taskFormView.should.exist
		taskFormView.form.should.exist
   
  it 'should invalidate', ->
  it 'should return attributes from the task', ->
  it 'should save a task if valid', ->
  it 'should fail save a task if invalid', ->
