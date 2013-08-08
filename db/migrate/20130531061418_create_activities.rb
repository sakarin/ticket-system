class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.date :publishing_at
      t.text :body
      t.boolean :status

      t.timestamps
    end
  end
end
