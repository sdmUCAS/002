class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :name
      t.string :sex
      t.string :uid
      t.string :phone
      t.string :email
      t.string :utype

      t.timestamps
    end
  end
end
