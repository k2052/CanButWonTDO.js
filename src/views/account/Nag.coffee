class Nag extends ModalView
	@content: ->

  initialize: ->
  	@pay_btn.click -> @openPay

  openPay: =>
  	@close()
  	@pay = new PayView()
