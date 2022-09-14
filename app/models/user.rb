class User < ApplicationRecord
  has_one :address, dependent: :destroy

  validates :auth_provider_name, :auth_user_id, :auth_user_email, presence: true

  validates :first_name, :last_name, presence: true, on: :basic_details
  validates :age, :date_of_birth, :gender, presence: true, on: :personal_details
end
