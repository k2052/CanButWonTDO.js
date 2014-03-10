Nag = require('../lib/views/Nag')

describe 'Nag View', ->
	it 'should create a nag view', ->
		nag = new Nag()

		nag.should.be.an.instanceOf Nag
		nag.should.exist
		nag.should.have.class('modal-view')
		nag.should.have.class('nag-view')

		nag.ignore_btn.should.exist
		nag.pay_btn.should.exist
    nag.should.be.visible

	it 'should close a nag view', ->
		nag = new Nag()
    nag.close()

    nag.should.be.hidden
    nag.should.have.class('hide-modal')

	it 'should close a nag view when ignore button is clicked', ->
		nag = new Nag()
    nag.ignore_btn.trigger('click')

    nag.should.be.hidden
    nag.should.have.class('hide-modal')	

  it 'should close a nag view and open a PayView when pay button is clicked', ->
		nag = new Nag()
    nag.pay_btn.trigger('click')
    
    nag.should.be.hidden
    nag.should.have.class('hide-modal')

		$('.pay-view').should.be.visible
