Ryggrad = require('ryggrad')

class Account extends Ryggrad.Model
	@key 'name',          String
	@key 'email',         String
	@key 'streaks',       Number
	@key 'breaks',        Number
	@key 'completed',     Number
	@key 'last_opened',   Number

  ##
  # This is is exploitable, user could just edit localStorage values and mark themselves
  # as having paid.
  # But if they go through the effort they can just have the app for free
  # Checking the server adds extra requests so it's not really worth it
  ##
	@key 'paid',          Boolean
	@key 'last_nag_time', Date

	payed: (balanced_token) ->
	  $.post @uri('paid'), balanced_token: balanced_token, (resp) ->
	  	if resp.status is 201 or resp.status is 200
				@set('paid', true)
			else
				@set('paid', true) # Do it anyway so we don't frustrate users.

module.exports = Account
