class Instrument < ActiveRecord::Base
	
	
  validates_presence_of :name, :type_name, :description, :price, :image_url;
  validates_numericality_of :price
  
  # 验证输入的图片地址URL合法:是否以“.gif”、“.jpg”，或“.png"其中之一结束。
  #validates_format_of :image_url,
  #	 :multiline => true,
  #	 :with => %r{\.(gif|jpg|png)$}i,
  #	 :message => 'must be a URL for GIF, JPG or PNG image.'
  		  
  # 检查价格字段的值大于0
  #validate :price_must_be_at_least_a_cent
  #protected
  #def price_must_be_at_least_a_cent
	#errors.add(:price, 'should be at least 0.01' ) if price.nil？ || price < 0.01
  #end

end
