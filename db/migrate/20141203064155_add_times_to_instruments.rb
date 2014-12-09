class AddTimesToInstruments < ActiveRecord::Migration
  def change
  	add_column :instruments, :monday, :string
  	add_column :instruments, :tuesday, :string
  	add_column :instruments, :wednesday, :string
  	add_column :instruments, :thursday, :string
  	add_column :instruments, :friday, :string
  	add_column :instruments, :saturday, :string
  	add_column :instruments, :sunday, :string 	
  end
end
