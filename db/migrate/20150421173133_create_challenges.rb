class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :body

      t.timestamps null: false
    end
  end
end
