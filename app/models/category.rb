class Category < ActiveRecord::Base
  has_many :post_categories, dependent: :destroy
  has_many :posts, through: :post_categories, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
end
