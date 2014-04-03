class Todo < ActiveRecord::Base
  
  belongs_to :user

  validates :description, length: { minimum: 2 }, presence: true

  default_scope -> { order('created_at ASC') }

end