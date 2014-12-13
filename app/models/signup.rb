class Signup < ActiveRecord::Base
  belongs_to :post
  belongs_to :leader, class_name: 'User', foreign_key: 'leader_id'

  validates :username, presence: true
  validates :email, presence: true
end