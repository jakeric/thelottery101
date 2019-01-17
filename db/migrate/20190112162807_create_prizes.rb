class CreatePrizes < ActiveRecord::Migration[5.2]
  def change
    create_table :prizes do |t|
      t.integer :rank
      t.string :title
      t.integer :value
      t.string :image
      t.references :ticket, foreign_key: true

      t.timestamps
    end
  end
end
