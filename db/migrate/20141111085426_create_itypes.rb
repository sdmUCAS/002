class CreateItypes < ActiveRecord::Migration
  def change
    create_table :itypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
