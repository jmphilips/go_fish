class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.integer :card_number
      t.string :suit
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
