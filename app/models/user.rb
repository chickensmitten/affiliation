class User < ActiveRecord::Base

  has_many :posts, dependent: :destroy

  has_many :follower_relationships, class_name: "Relationship", foreign_key: "leader_id", dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :leader_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :leader_relationships, source: :leader 

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 5}
  before_create { generate_token(:auth_token) }

  def admin?
    self.role == 'admin'
  end

  def moderator?
    self.role == 'moderator?'
  end

  def feed
    following_ids = "SELECT leader_id FROM relationships
                     WHERE  follower_id = :user_id"
    Post.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id) # Produces feeds for timeline
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
