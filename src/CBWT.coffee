class CBWT extends Ryggrad.Controller
	version: '0.0.1'
	
	constructor: ->
		@app = new AppView()
		window?.current_day = Day.buildCurrentDay()

module.exports.CBWT = CBWT
window?.current_account = Account.first
