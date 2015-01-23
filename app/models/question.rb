class Question < ActiveRecord::Base
  belongs_to  :survey
  has_many    :responses
  has_many  :users, through: :responses #Instead, of using this association to get the user who wrote the question. get creator's id through the survey attribute user_id.

  accepts_nested_attributes_for :responses

end