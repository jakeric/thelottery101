class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :ticket
      t.string :name

      t.timestamps
    end
  end
end
