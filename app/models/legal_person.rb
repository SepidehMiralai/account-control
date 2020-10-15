class LegalPerson < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :accounts, as: :accountable

  validates :company_name, :fantasy_name, :federal_business_number, presence: true
end
