class Days extends View
	@content: ->
		@div =>
			@ul class: 'list',  outlet: 'list', =>

	emptyAbove: (num = 20) ->
		@list.each (day, index) ->
			day.remove() if index <= num 
			break if num == index

	initialize: ->
		unless current_day.tasks().count() > 0
			@startATaskView = new StartATaskView()
			@list.append(@startATaskView)

		@add(Day.all(limit: 10))
    
	add: (days) ->
		unless Array.isArray(days)
			days = [days]

		for day in days
			dayView = new DayView(day)
			@list.append(dayView)

			if isLast
				dayView.waypoint =>
					@emptyAbove(index)
					@add(Day.all(skip: index, limit: 10))
