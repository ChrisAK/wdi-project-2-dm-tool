class CreateEncounters < ActiveRecord::Migration[5.0]
  def change
    create_table :encounters do |t|
      t.string :name
      t.integer :CR
      t.string :books
      t.text :description
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
