class StatBar extends View
	taskIconType: (task) ->
		if task.done 
			'task success' 
		else task.failed
			'task failed' 
		else
			'task blank'

	addTask: (task) ->
		@addIcon @taskIconType(task)

	addIcon: (type, lineColor) ->
		@icon = new Icon(type)

    # We starting a new line
		if lineColor
			@current_line = addLine()
			@current_line.height @current_line.height + @icon.height()
		else
			@current_line.height @current_line.height + @icon.height()

