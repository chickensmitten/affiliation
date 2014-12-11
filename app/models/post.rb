class Post < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :bounties, dependent: :destroy
  validates :description, presence: true
  accepts_nested_attributes_for :bounties, :reject_if => :all_blank, :allow_destroy => true
  self.per_page = 10

end
