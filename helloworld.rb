require 'sinatra'
require './bowling'

get '/' do
  bowling = Bowling.new
  bowling.hit
  "Hello World, #{bowling.score}!"
end
