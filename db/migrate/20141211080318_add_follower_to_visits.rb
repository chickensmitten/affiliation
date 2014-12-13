class AddFollowerToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :follower_id, :integer
    add_column :visits, :leader_id, :integer
  end
end
