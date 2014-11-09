class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :name
      t.string :type_name
      t.string :image_url
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
