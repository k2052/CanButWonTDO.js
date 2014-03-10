FormView = require('../lib/FormView')

class TaskForm extends FormView
	@content: ->
		@div =>
			@form outlet: 'form' =>

  initialize: (@task) ->
  	@editing = if @task then true else false
    
    if @editing
    	@addClass('editing')
    	@form.attr('method', 'PUT')

    	@initFormWithAttributeValues()

    @form.submit -> @saveTask

  saveTask: (e) =>
  	e.preventDefault()
  	@task = Task.fromForm(@[0]) unless @task

  	if @task.isValid()
  		@addClass('saving')
	    @task.save()
	    @task.bind 'create update', ->
	    	@trigger 'success'
	    	@removeClass('saving')
		    @addClass('green')
	  else 
		  @trigger 'failed'
		  @invalidate()

	invalidations: ->
		@task.invalidations()

	attributes: ->
		@task.attributes()
