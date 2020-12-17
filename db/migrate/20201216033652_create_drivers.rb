class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :license
      t.string :car
      t.string :account
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
