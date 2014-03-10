View = require('ryggrad').View

class App extends View
	@content: ->
		@div =>
			@div class: 'header', =>
				@div class: 'stats', =>
				@div class: 'add', =>
					@a class: 'add-button button', outlet: 'add'
			@div class: 'footer', =>
				@a class: 'account icon', outlet: 'account_button'

  initialize: () ->
  	@main = new MainView()
  	@main.insertBefore @footer

  	@tasksView = new Tasks()
  	@main.add('tasks', @tasksView).active('tasks')

  	@accountView = new AccountView()
  	@main.add('account', @accountView)
  	@add_button.click -> @addTodo
		@account_button.click -> @openAccount

  addTodo: =>
  	form = new TaskForm()
  	@main.add('task_form', form).active('task_form')

  	form.bind 'success', ->
  		@main.restore()
      
	openAccount: =>
		@main.active('account')
		
module.exports = App
