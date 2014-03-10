Day     = require('../lib/models/Day')
DayView = require('../lib/views/Day')

describe 'Day View', ->
	it 'should create a Day view', ->
		day = new DayView(Day.create())

		day.should.be.an.instanceOf DayView
		day.should.exist
		day.should.have.class('day-view')
 
		day.tasks.should.exist
		day.statBar.should.exist
		day.open_btn.should.exist
    day.should.be.visible
  
  it 'should add tasks', -> 
	  day = Day.create()
	  task = Task.create name: 'Test Task', body: 'test task body'
	  day.addTasks(task)

	  dayView = new DayView(day)

	  dayView.tasks.should.be.empty
    
    dayView.renderTasks()
	  dayView.tasks.length.should.be 1

  it 'should render tasks when opened and remove them when closed', ->
  	day = Day.create()
	  task = Task.create name: 'Test Task', body: 'test task body'
	  day.addTasks(task)

	  dayView = new DayView(day)
	  dayView.toggleTasks()

	  dayView.isOpen.should.be.true
	  dayView.tasks.length.should.be 1

	  dayView.toggleTasks()
	  dayView.isOpen.should.be.false
	  dayView.tasks.should.be.empty
