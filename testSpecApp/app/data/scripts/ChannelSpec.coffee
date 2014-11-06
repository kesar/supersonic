describe "supersonic.data.channel", ->
  it "is a function", ->
    supersonic.data.channel.should.be.a 'function'

  it "accepts a channel name and returns a channel", ->
    supersonic.data.channel('foo').name.should.equal 'foo'

  describe "publish()", ->
    it "is a function", ->
      supersonic.data.channel('foo').publish.should.be.a 'function'

  describe "subscribe()", ->
    it "is a function", ->
      supersonic.data.channel('foo').subscribe.should.be.a 'function'