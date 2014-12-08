class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
	  t.string :card_id
      t.string :belong_to
      t.string :phone
      t.timestamps
    end
    create_table :users_cards do |t|
      t.string :card_id
      t.string :username
	end
  end
end
