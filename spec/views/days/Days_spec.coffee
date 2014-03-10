Days = require('../lib/views/Days')

describe 'Days View', ->
	it 'should create a Days view', ->
		days = new DaysView()
		days.should.exist
		days.list.should.exist

	it 'should add a day', ->
		days = new DaysView()
		day = Day.create()
		days.add(day)

		days.list.should.contain "[day=#{day.day}"

  it 'should add a startATaskView instead of day when day has no tasks', ->
		days = new DaysView()
		days.startATaskView.should.exist
		days.list.should.contain ".start-a-task.view"

	it 'should empty days above a position', ->
		
	it 'should add more days when a waypoint is hit', ->
 