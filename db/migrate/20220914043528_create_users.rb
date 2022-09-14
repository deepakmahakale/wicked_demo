class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :age
      t.string :gender
      t.string :date_of_birth

      t.timestamps
    end
  end
end
