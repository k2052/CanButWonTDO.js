class Pay extends ModalFormView
	@content: ->
		@div 
			@form method: 'POST'

  initialize: ->
  	@cc_num.payment('formatCardNumber')
		@cc_exp.payment('formatCardExpiry')
		@cc_cvc.payment('formatCardCVC')

  	@form.submit -> @pay

  pay: (e) =>
  	e.preventDefault()
    return @addBaseError('Invalid Card') unless isValid()

  	@addClass('processing')
  	@setMessage('Processing Payment')

    balanced.card.create @card(), (resp) ->
    	if response.status is 201 and response.uri
    		current_account.payed(resp)
    		@success('Processed Payment Successfully')
    	else
	    	switch response.status
					when 400
						@addBaseError("Missing Field")
					when 402
						@addBaseError("Couldn't Authorize")
			    else 
				    @addBaseError("Something Went Wrong Try Again")

    	@removeClass('processing')
  
  exp: ->
  	@cc_exp.payment('cardExpiryVal')

  isValid: ->
    balanced.card.validate(@card()) 

  card: ->
    name: @cc_name.val()
		card_number: @cc_num.val()
		expiration_month: @exp.month()
		expiration_year: @exp.year()
		security_code:   @cc_cvc.val()
