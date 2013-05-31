class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.string :name
      t.integer :company_id

      t.timestamps
    end
  end
end
