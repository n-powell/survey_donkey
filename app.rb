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


# path to individual survey
get("/survey/:id") do
  @survey = Surveys.find(params['id'].to_i)
  erb(:survey)
end


# path to update survey name
patch("/edit_survey/:id") do
  new_title = params['edit-title']
  survey = Surveys.find(params['id'].to_i)
  survey.update(title: new_title)
  redirect("/survey/#{survey.id}")
end

# path to delete a survey
delete("/delete_survey/:id") do
  survey = Surveys.find(params['id'].to_i)
  survey.delete
  redirect("/surveys")
end
