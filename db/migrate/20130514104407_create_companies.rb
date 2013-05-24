class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :address
      t.string :tel
      t.string :fax

      t.string :company_type

      t.timestamps
    end
  end
end
