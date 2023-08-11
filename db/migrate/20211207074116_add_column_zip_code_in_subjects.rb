class AddColumnZipCodeInSubjects < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :zip_code, :integer  
  end
end
