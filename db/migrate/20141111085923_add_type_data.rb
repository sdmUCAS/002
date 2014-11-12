class AddTypeData < ActiveRecord::Migration
  def change
  end
  
 # def self.up
 # 	Itype.delete_all
 # 	Itype.create(:name=>'化学')
  #	Itype.create(:name=>'生物')
  #	Itype.create(:name=>'电子')
  #	Itype.create(:name=>'物理')
  #	Itype.create(:name=>'医学')
  #end
  
  def self.down
  	Itype.delete_all
  end
end
