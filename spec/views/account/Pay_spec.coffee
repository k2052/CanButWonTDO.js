Pay = require('../lib/views/Pay')

describe 'Pay View', ->
	it 'should create a Pay view', ->
		pay = new Pay()

		pay.should.be.an.instanceOf Pay
		pay.should.exist
		pay.should.have.class('modal-view')
		pay.should.have.class('pay-view')

    pay.should.be.visible
		pay.close_btn.should.exist
		pay.submit_btn.should.exist
		pay.form.should.exist
		pay.cc_num.should.exist
		pay.cc_exp.should.exist
		pay.cc_cvc.should.exist

  it 'should return the card expiration', ->
  	pay = new Pay()
  	pay.cc_exp.val('12/2014')

  	pay.exp.month.should.equal '12'
  	pay.exp.year.should.equal '2014'

  it 'should return the card as an object', ->
  	pay = new Pay()
  	pay.cc_name.val 'John Doe'
  	pay.cc_num.val  '4111111111111111'
  	pay.cc_exp.val  '12/2014'
  	pay.cc_cvc      '123'
   
    card =
	    name: 'John Doe'
			card_number: '4111111111111111'
			expiration_month: '12'
			expiration_year: '2014'
			security_code: '123'

		pay.card().should.equal card

  it 'should validate the card', ->
  	pay = new Pay()

  	pay.cc_name.val 'John Doe'
  	pay.cc_num.val  '4111111111111111'
  	pay.cc_exp.val  '12/2014'
  	pay.cc_cvc      '123'

  	pay.isValid().should.be.true

  	pay.cc_num.val '1'
  	pay.isValid().should.be.false

  describe 'Payment', ->
  	stub = undefined

  	beforeEach ->
	    stub = sinon.stub(balanced.card, "create")

	    sinon.stub(current_account, 'payed')

	  afterEach ->
	    stub.restore()
	    current_account.payed.restore()

	  it 'should submit a payment to balanced', ->
	    stub.returns
		    status: 201
		    uri: 'blah'

			pay = new Pay()
			pay.cc_name.val 'John Doe'
	  	pay.cc_num.val  '4111111111111111'
	  	pay.cc_exp.val  '12/2014'
	  	pay.cc_cvc      '123'

			pay.form.trigger('submit')
			stub.should.have.been.called

	  it 'should add an error if card is invalid', ->
			pay = new Pay()
			pay.form.trigger('submit')

			pay.errors('base').should.equal 'Invalid Card'
			pay.baseError.should.contain 'Invalid Card'

	  it 'should add an error if balanced returns missing field', ->
	    stub.returns
		    status: 400
		    uri: 'blah'

			pay = new Pay()
			pay.cc_name.val 'John Doe'
	  	pay.cc_num.val  '4111111111111111'
	  	pay.cc_exp.val  '12/2014'
	  	pay.cc_cvc      '123'
			pay.form.trigger('submit')

			pay.errors('base').should.equal "Missing Field"
			pay.baseError.should.contain "Missing Field"

	  it "should add an error if balanced returns couldn't authorize", ->
	    stub.returns
		    status: 402
		    uri: 'blah'

			pay = new Pay()
			pay.cc_name.val 'John Doe'
	  	pay.cc_num.val  '4111111111111111'
	  	pay.cc_exp.val  '12/2014'
	  	pay.cc_cvc      '123'
			pay.form.trigger('submit')

			pay.errors('base').should.equal "Couldn't Authorize"
			pay.baseError.should.contain "Couldn't Authorize"

	  it "should add an authorization error if balanced returns 402", ->
	    stub.returns
		    status: 500
		    uri: 'blah'

			pay = new Pay()
			pay.cc_name.val 'John Doe'
	  	pay.cc_num.val  '4111111111111111'
	  	pay.cc_exp.val  '12/2014'
	  	pay.cc_cvc      '123'
			pay.form.trigger('submit')

			pay.errors('base').should.equal "Something Went Wrong Try Again"
			pay.baseError.should.contain "Something Went Wrong Try Again"
