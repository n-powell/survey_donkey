class Surveys < ActiveRecord::Base
  has_many(:questions)
end
