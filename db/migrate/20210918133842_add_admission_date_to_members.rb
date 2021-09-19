class AddAdmissionDateToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :addmission_date, :datetime
  end
end
