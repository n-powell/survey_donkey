require "sinatra"
require "sinatra/reloader"
require("sinatra/activerecord")
require "./lib/surveys"
require "pry"

also_reload "lib/**/*.rb"

get "/" do
  erb :index
end

get("/make_survey") do
  @surveys = Surveys.all
  erb(:make_survey)
end

post("/add_survey") do
  survey = params['add-survey']
  Surveys.create(title: survey)
  redirect('/make_survey')
  @surveys = Surveys.all
  erb(:make_survey)
end
