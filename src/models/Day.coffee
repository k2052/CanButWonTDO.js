class Day
	@key "day", Number

  @tasks: new Collection(
    model: Task
  )

  @buildCurrentDay: ->
  	unless day = Day.findBy('day', new Date().getDoy())
	  	day = Day.create()

    day

  constructor: ->
  	super
  	@set 'day', new Date().getDoy() unless @get 'day'

  addTask: (task) -> 
    task.set 'day_id', @get 'id'
    task.save()
	  @tasks.add(task)
