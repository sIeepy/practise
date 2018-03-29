class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.integer :rating
      t.integer :user_id
      t.integer :movie_id

      t.timestamps
    end

    add_index :rates, :user_id
    add_index :rates, :movie_id
  end
end
