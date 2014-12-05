class AddHoursToInstruments < ActiveRecord::Migration
  def change
  	add_column :instruments, :morning, :string
  	add_column :instruments, :afternoon, :string
  	add_column :instruments, :night, :string
  end
end
