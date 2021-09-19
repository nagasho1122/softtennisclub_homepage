class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :position
      t.string :from
      t.text :text
      t.string :department
      t.string :director
      t.text :word

      t.timestamps
    end
  end
end
