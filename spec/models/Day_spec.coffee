Day = require('../lib/models/Day')

describe 'Day', ->
	it 'should create a day for today', ->
		day = new Day()
		day.should.be.an.instanceOf Day
		day.day.should.equal Date.getDayofYear()

  it 'should build a day for today', ->
		day = Day.buildCurrentDay()
		day.should.be.an.instanceOf Day
		day.day.should.equal Date.getDayofYear()

	it 'should create a Day and destroy it', ->
		day = Day.create()
		day.should.be.an.instanceOf Day

		day.id.should.not.be.null

		id = day.id
		day.destroy().should.be.true

		day = Day.find(id)
		day.should.be.null
  
  it 'should add tasks to a day', ->
  	day = Day.create()
  	day.tasks.count.should.equal 0

    task = Task.create(name: 'Test Task')
  	day.addTask(task)
  	day.tasks.count.should.equal 1
  	task.day_id.should.equal day.id

  	day.destroy()
  	