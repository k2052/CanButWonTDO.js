class NewTask extends View
	@content: ->
		@div =>
			@h1 'What can you do today but wont?'
			@div class: 'form-wrap', outlet: 'formWrap'

	initialize: ->
		@form = new TaskForm()
		@formWrap.append(@form)
