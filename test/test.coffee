chai = require "chai"
expect = chai.expect
order = require "../lib/order"

describe "order()", () ->
  it "should return correct indices for inc seq", () ->
    expect(order([1..4])).to.be.eql([0..3])
  it "should return correct indices for dec seq", () ->
    expect(order([4..1])).to.be.eql([3..0])
  it "should return correct indices for any integer seq", () ->
    expect(order([2,1,3,4])).to.be.eql([1,0,2,3])
    expect(order([2,3,1])).to.be.eql([2,0,1])
  it "should return [0] for array with one element", () ->
    expect(order([24])).to.be.eql([0])
  it "should return correct indices for array of floating point numbers", () ->
    expect(order([2.4, -1.2, 3.6, 100.0])).to.be.eql([1, 0, 2, 3])
  it "works when custom compareFunction is supplied (e.g. decreasing)", () ->
    expect(order([1..4], (a,b) -> b-a)).to.be.eql([3..0])
