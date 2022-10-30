class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  
  validates :address, :established_year, presence: true
  
  belongs_to :user
end
