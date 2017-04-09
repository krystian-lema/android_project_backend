class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.integer :score
      t.string :nickname
      t.datetime :date

      t.timestamps
    end
  end
end
