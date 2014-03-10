class Modal extends View
	initialize: ->
		@close_btn.click -> @close
  
  close: ->
  	@addClass('hide')
  	@removeClass('show')
