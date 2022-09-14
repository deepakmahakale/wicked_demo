class AddAuth0FieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :auth_provider_name, :string, null: false, index: true
    add_column :users, :auth_user_id, :string, null: false, index: true
    add_column :users, :auth_user_email, :string, null: false, index: true
    remove_column :users, :email, :string
  end
end
