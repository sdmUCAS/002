class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :cotent

      t.timestamps
    end
  end
end
