class OrdersInstrument < ActiveRecord::Base
  belongs_to :order
  belongs_to :instrument
end
