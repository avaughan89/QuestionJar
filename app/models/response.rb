class Response < ActiveRecord::Base
  belongs_to  :question
  belongs_to  :user  #user who gave response.

end
