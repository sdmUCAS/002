class LineItem < ActiveRecord::Base
  belongs_to :instrument
  belongs_to :cart
  belongs_to :order
  def total_price
	instrument.price * quantity
  end
end
