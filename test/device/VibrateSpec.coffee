chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

vibrate = require('../../src/supersonic/device/vibrate')

describe "supersonic.device.vibrate", ->
  it "should exist", ->
    vibrate.should.exist
