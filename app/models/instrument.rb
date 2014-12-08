class Instrument < ActiveRecord::Base
  has_many :line_items
  has_many :orders, through: :line_items
  validates_presence_of :name, :type_name, :image_url, :description, :price
  validates_numericality_of :price
  
  # 验证输入的图片地址URL合法:是否以“.gif”、“.jpg”，或“.png"其中之一结束。
  validates_format_of :image_url,
  	 :multiline => true,
  	 :with => %r{\.(gif|jpg|png)$}i,
  	 :message => 'must be a URL for GIF, JPG or PNG image.'
  		  
  # 检查价格字段的值大于0
  #validate :price_must_be_at_least_a_cent
  #protected
  #def price_must_be_at_least_a_cent
	#errors.add(:price, 'should be at least 0.01' ) if price.nil？ || price < 0.01
  #end
  
  before_destroy :ensure_not_referenced_by_any_line_item
  
  private
 # ensure that there are no line items referencing this product
	def ensure_not_referenced_by_any_line_item
	if line_items.empty?
 	  return true
 	else
 	  errors.add(:base, 'Line Items present' )
 	return false
 	end
   end
 
end
