class User < ApplicationRecord
  has_one :address, dependent: :destroy

  validates :email, :first_name, :last_name, presence: true
  validates :age, :date_of_birth, :gender, presence: true, on: :personal_details
end
