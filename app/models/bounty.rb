class Bounty < ActiveRecord::Base
  belongs_to :post, dependent: :destroy
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  
  validates :title, presence: true
  validates :description, presence: true
end
