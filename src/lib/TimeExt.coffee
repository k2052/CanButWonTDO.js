class TimeExt
	included: ->
		@constructor.key "created_at", Date
	  @constructor.key "updated_at", Date
    
    @on 'create', ->
	    @set('created_at', new Date())     

	  @on 'update', ->
	    @set('updated_at', new Date()) 
