class Day extends View
	@content: ->
		@div =>

	initialize: (@day) ->
		@statBar = new StatBar(@)
		@append(@statBar)
		@open_btn.click @toggleTasks

	toggleTasks: =>
		if @isOpen
			@isOpen = false
			@list.empty()
		else
			@isOpen = true
			@renderTasks()

	renderTasks: =>
		for task in @day.tasks()
			@tasks.append(new TaskView(@, task))
			@statBar.addTask(task)
