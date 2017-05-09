require "sinatra"
require "sinatra/reloader"
require("sinatra/activerecord")
require "./lib/surveys"
require "pry"

also_reload "lib/**/*.rb"

# route to index
get "/" do
  erb :index
end

# route to see surveys
get("/surveys") do
  @surveys = Surveys.all
  erb(:surveys)
end

# route to add a survey to db
post("/add_survey") do
  survey = params['add-survey']
  Surveys.create(title: survey)
  redirect('/surveys')
  @surveys = Surveys.all
  erb(:surveys)
end

get("/survey/:id") do
  @survey = Surveys.find(params['id'].to_i)
  erb(:survey)
end
