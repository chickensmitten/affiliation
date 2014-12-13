class RemoveUrlFromRelationship < ActiveRecord::Migration
  def change
    remove_column :relationships, :url
  end
end
