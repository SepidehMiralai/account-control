class AddFieldsToLegalPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :legal_people, :company_name, :string
    add_column :legal_people, :fantasy_name, :string
    add_column :legal_people, :federal_business_number, :string
  end
end
