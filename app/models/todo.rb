class Todo < ActiveRecord::Base
  
  validates :description, length: { minimum: 2 }, presence: true

end