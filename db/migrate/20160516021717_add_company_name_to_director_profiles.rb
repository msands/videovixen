class AddCompanyNameToDirectorProfiles < ActiveRecord::Migration
  def change
    add_column :director_profiles, :company_name, :string
  end
end
