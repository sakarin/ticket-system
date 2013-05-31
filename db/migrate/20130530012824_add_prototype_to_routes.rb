class AddPrototypeToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :prototype_id, :integer
  end
end
