class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :instructions
      t.string :example
      t.string :category
      t.string :documentation

      t.timestamps null: false
    end
  end
end
