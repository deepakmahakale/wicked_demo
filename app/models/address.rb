class Address < ApplicationRecord
  belongs_to :user

  validates :address_line1, :zip, :city, :country_code, presence: true
end
