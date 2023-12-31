class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :subject
      t.text :message
      t.boolean :read

      t.timestamps
    end
  end
end
