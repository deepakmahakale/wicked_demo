class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :zip
      t.string :country_code

      t.timestamps
    end
  end
end
