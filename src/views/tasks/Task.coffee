class TaskView extends View
	initialize: (@task, @statBar) ->
		@icon = @statBar.addIcon(null)
		@setIcon()
		@task.change 'done failed' @setIcon()
  
  setIcon: =>
 		if @task.done
			@icon.set('check')
		else if @task.failed
			@icon.set('failed')
		else
			@icon.set('circle')
