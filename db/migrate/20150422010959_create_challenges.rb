class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :category
      t.string :instructions      
      t.string :answer
      t.string :starter
      t.string :documentation

      t.timestamps null: false
    end
  end
end
