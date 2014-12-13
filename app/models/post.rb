class Post < ActiveRecord::Base

  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'

  validates :description, presence: true

  self.per_page = 10

end
