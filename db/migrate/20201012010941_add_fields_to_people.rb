class AddFieldsToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :full_name, :string
    add_column :people, :birth_date, :datetime
    add_column :people, :social_insurance_number, :string
  end
end
