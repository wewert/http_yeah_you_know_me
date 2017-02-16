require 'minitest/autorun'
require 'minitest/pride'
require './lib/http_i0'
require 'net/http'
require 'pry'

class Httpi0 < Minitest::Test
  def test_that_get_works
    uri = URI('http://127.0.0.1:9292')
    resp = Net::HTTP.get_response(uri)
    puts "THE CLASS'S PUBLIC METHODS #{(resp.public_methods - Object.public_methods).sort}"
    assert '200', resp.code
    assert 'OK', resp.message
  end


end
