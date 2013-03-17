class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :tat_no
      t.text :address
      t.string :website
      t.string :telephone1
      t.string :telephone2
      t.string :fax

      t.timestamps
    end
  end
end
