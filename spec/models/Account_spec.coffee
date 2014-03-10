Account = require('../lib/models/Account')

describe 'account', ->
	it 'should create an account and destroy it', ->
		Account.disableSync()
		account = Account.create name: 'Jerry', email: 'bob@cats.com'
		account.should.be.an.instanceOf Account

		account.id.should.not.be.null
		account.name.should.equal 'Jerry'
		account.email.should.equal 'bob@cats.com'

		id = account.id
		account.destroy().should.be.true

		account = Account.find(id)
		account.should.be.null

	it 'should refuse to create an invalid account', ->
		expect(->
				account = Account.create name: 'Jerry'
	  ).to.throw(Error, "Email Required")
  
  it "should update an Account", ->
  	account = Account.create name: 'Jerry', email: 'bob@cats.com'
		account.set 'name', 'Bob'

		account = Account.find account.id
		account.name.should.equal 'Bob'

		account.destroy()
