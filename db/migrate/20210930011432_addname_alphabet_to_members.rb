class AddnameAlphabetToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :name_alphabet, :string
  end
end
