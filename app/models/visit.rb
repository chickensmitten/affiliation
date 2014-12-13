class Visit < ActiveRecord::Base
  has_many :ahoy_events, class_name: "Ahoy::Event"
  belongs_to :user
  belongs_to :follower, :class_name=>"User", :foreign_key=>:follower_id
  belongs_to :leader, :class_name=>"User", :foreign_key=>:leader_id
end
