class Main extends View
	views: []

	add: (name, view) ->
		@views[name] = view
		@append(view)

	setActive: (name) ->
		@prev = @active
		@active.addClass('hide')
		@active = @views[name]
		@active.addClass('show')
		@
  
  restore: ->
  	@active.addClass('hide')
  	@prev.addClass('show')
  	@active = @prev
