class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.references :user, null: true, foreign_key: true
      t.references :post, null: true, foreign_key: true

      t.timestamps
    end
  end
end
