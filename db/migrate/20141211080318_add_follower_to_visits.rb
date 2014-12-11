class AddFollowerToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :follower, :integer
  end
end
