class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :scheduled_day
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
